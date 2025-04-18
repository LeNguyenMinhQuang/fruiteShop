package vn.fruitshop.quang.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
// import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.fruitshop.quang.domain.Role;
import vn.fruitshop.quang.domain.User;
import vn.fruitshop.quang.service.UploadService;
import vn.fruitshop.quang.service.UserService;
import org.springframework.web.bind.annotation.PostMapping;

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
  public String GetUserPage(Model model, @RequestParam("page") Optional<String> pageOptional) {

    int page = pageOptional.isPresent() ? Integer.parseInt(pageOptional.get()) : 1;

    Pageable pageable = PageRequest.of(page - 1, 5);

    Page<User> users_ = this.userService.handleGetAllUsers(pageable);
    long pages = users_.getTotalPages();

    List<User> users = users_.getContent();

    model.addAttribute("users", users);
    model.addAttribute("currentPage", page);
    model.addAttribute("pages", pages);
    return "admin/user/show";
  }

  @GetMapping("/admin/user/create")
  public String GetCreateUserPage(Model model) {
    model.addAttribute("newUser", new User());
    return "admin/user/create";
  }

  @PostMapping("/admin/user/create")
  public String PostCreateUserpage(Model model, @ModelAttribute("newUser") @Valid User newUser,
      BindingResult newUserBindingResult,
      @RequestParam("avatarFile") MultipartFile file) {

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

  @GetMapping("/admin/user/{id}")
  public String GetUserDetailPage(Model model, @PathVariable long id) {
    User user = this.userService.handleGetUserById(id);
    model.addAttribute("user", user);
    return "admin/user/detail";
  }

  @GetMapping("/admin/user/update/{id}")
  public String GetUpdateUserPage(Model model, @PathVariable long id) {
    User updateUser = this.userService.handleGetUserById(id);
    model.addAttribute("updateUser", updateUser);
    return "admin/user/update";
  }

  @PostMapping("/admin/user/update")
  public String PostUpdateUserPage(Model model, @ModelAttribute("updateUser") User updateUser,
      @RequestParam("avatarFile") MultipartFile file) {
    User user = this.userService.handleGetUserById(updateUser.getId());
    if (user != null) {
      // avatar
      String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
      user.setAvatar(avatar);

      // role
      Role role = updateUser.getRole();
      String roleName = role.getName();
      Role newRole = this.userService.handleGetRole(roleName);
      user.setRole(newRole);

      user.setFullName(updateUser.getFullName());
      user.setAddress(updateUser.getAddress());
      user.setPhone(updateUser.getPhone());

      // save
      this.userService.handleSaveUser(user);
    }
    return "redirect:/admin/user";
  }

  @GetMapping("/admin/user/delete/{id}")
  public String GetDeleteUserPage(Model model, @PathVariable long id) {
    User user = this.userService.handleGetUserById(id);
    model.addAttribute("deleteUser", user);
    return "admin/user/delete";
  }

  @PostMapping("/admin/user/delete")
  public String PostDeleteUserPage(Model model, @ModelAttribute("deleteUser") User deleteUser) {
    this.userService.handleDeleteUserById(deleteUser.getId());

    return "redirect:/admin/user";
  }

}
