package vn.fruitshop.quang.controller.client;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import vn.fruitshop.quang.domain.User;
import vn.fruitshop.quang.domain.dto.RegisterDTO;
import vn.fruitshop.quang.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AuthController {
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public AuthController(UserService userService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "client/auth/login";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String postMethodName(Model model, @ModelAttribute("registerUser") @Valid RegisterDTO registerUser,
            BindingResult bindingResult) {
        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>" + error.getDefaultMessage());

        }
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }
        User user = this.userService.handleCreateUserFromRegisterDTO(registerUser);
        user.setPassword(this.passwordEncoder.encode(registerUser.getPassword()));
        user.setRole(this.userService.handleGetRole("USER"));
        this.userService.handleSaveUser(user);

        return "redirect:/login";
    }

}
