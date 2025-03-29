package vn.fruitshop.quang.controller.admin;

import java.util.List;

// import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.fruitshop.quang.domain.Role;
import vn.fruitshop.quang.domain.User;
import vn.fruitshop.quang.service.UploadService;
import vn.fruitshop.quang.service.UserService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class UserController {

  private final UserService userService;
  private final UploadService uploadService;
  // private final PasswordEncoder passwordEncoder;

  public UserController(UserService userService, UploadService uploadService) {
    this.userService = userService;
    this.uploadService = uploadService;
    // this.passwordEncoder = passwordEncoder;
  }

  @GetMapping("/admin/user")
  public String GetUserPage(Model model) {
    List<User> users = this.userService.handleGetAllUsers();
    System.out.println(users.size());
    model.addAttribute("route", "/user/content.jsp");
    model.addAttribute("users", users);
    return "admin/show";
  }

  @GetMapping("/admin/user/create")
  public String GetCreateUserPage(Model model) {
    model.addAttribute("route", "/user/create.jsp");
    model.addAttribute("newUser", new User());
    return "admin/show";
  }

  @PostMapping("/admin/user/create")
  public String PostCreateUserpage(Model model, @ModelAttribute("newUser") @Valid User newUser,
      BindingResult newUserBindingResult,
      @RequestParam("avatarFileUpload") MultipartFile file) {

    // validate
    List<FieldError> errors = newUserBindingResult.getFieldErrors();
    for (FieldError error : errors) {
      System.out.println(">>>>>" + error.getField() + " - " + error.getDefaultMessage());
    }

    if (newUserBindingResult.hasErrors()) { // nếu có lỗi thì trả về trang create
      return "admin/user/create";
    }

    // avatar
    String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
    newUser.setAvatar(avatar);

    // password
    // String hashPassword = this.passwordEncoder.encode(newUser.getPassword());
    // newUser.setPassword(hashPassword);

    // role
    Role role = newUser.getRole();
    String roleName = role.getName();
    Role newRole = this.userService.handleGetRole(roleName);
    newUser.setRole(newRole);

    // save
    this.userService.handleSaveUser(newUser);

    return "redirect:/admin/user";
  }

}
