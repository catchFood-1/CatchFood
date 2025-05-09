package com.catchfood.controller;

import java.io.File;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.catchfood.dao.ReviewDao;
import com.catchfood.dto.ReviewDto;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReviewController {

    @Autowired
    ReviewDao reviewdao;

    // application.properties에서 주입받기 (외부 저장 경로)
    @Value("${upload.path}")
    private String uploadPath;

    @RequestMapping("/insert")
    public String insert() {
        return "Review/reviewinsert";
    }

    @PostMapping("/writer")
    public String reviewInsert(@ModelAttribute ReviewDto dto,
                               @RequestParam("imageFile") MultipartFile[] files,
                               HttpSession session,
                               Model model
    						) {

        StringBuilder imagePaths = new StringBuilder();

        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
                try {
                    String originalName = file.getOriginalFilename();
                    String cleanName = originalName.replaceAll("[^a-zA-Z0-9._-]", "_");
                    String fileName = System.currentTimeMillis() + "_" + cleanName;

                    File saveFile = new File(uploadPath + fileName);
                    saveFile.getParentFile().mkdirs();
                    file.transferTo(saveFile);

                    imagePaths.append("/").append(fileName).append(",");
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        if (!imagePaths.isEmpty()) {
            imagePaths.setLength(imagePaths.length() - 1);
            dto.setReviewImage(imagePaths.toString()); 
        }
        
       
       dto.setReviewDay(LocalDateTime.now());
        reviewdao.ReviewInsert(dto);

        return "redirect:/review";
    }

    @RequestMapping("/review")
    public String ReviewListPage(@RequestParam(name = "page", defaultValue = "1") int page, Model model) {
        int pageSize = 10;
        int startRow = (page - 1) * pageSize;
        int totalCount = reviewdao.getTotalCount();
        int totalPage = (int) Math.ceil(totalCount / (double) pageSize);

        List<ReviewDto> reviewList = reviewdao.ReviewListPage(startRow, pageSize);

        model.addAttribute("review", reviewList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("totalCount", totalCount);
        return "Review/reviewlist";
    }
}