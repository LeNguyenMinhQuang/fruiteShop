package vn.fruitshop.quang.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import vn.fruitshop.quang.domain.User;
import vn.fruitshop.quang.domain.dto.RegisterDTO;
import vn.fruitshop.quang.repository.RoleRepository;
import vn.fruitshop.quang.domain.Role;
import vn.fruitshop.quang.repository.UserRepository;

@Service
public class UserService {

  private final RoleRepository roleRepository;
  private final UserRepository userRepository;

  public UserService(UserRepository userRepository, RoleRepository roleRepository) {
    this.userRepository = userRepository;
    this.roleRepository = roleRepository;
  }

  // Role

  public Role handleGetRole(String name) {
    return this.roleRepository.findByName(name);
  }

  // Save

  public User handleSaveUser(User newUser) {
    User user = this.userRepository.save(newUser);
    return user;
  }

  public User handleCreateUserFromRegisterDTO(RegisterDTO registerDTO) {
    User user = new User();
    user.setEmail(registerDTO.getEmail());
    user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
    user.setPassword(registerDTO.getPassword());
    return user;
  }

  // Get

  public List<User> handleGetAllUsers() {
    return this.userRepository.findAll();
  }

  public Page<User> handleGetAllUsers(Pageable pageable) {
    return this.userRepository.findAll(pageable);
  }

  public User handleGetUserById(long id) {
    return this.userRepository.findById(id);
  }

  public User handleGetUserByEmail(String email) {
    return this.userRepository.findFirstByEmail(email);
  }

  public Boolean handleCheckEmailExist(String email) {
    User user = this.userRepository.findFirstByEmail(email);
    if (user != null) {
      return true;
    } else {
      return false;
    }
  }

  public void handleDeleteUserById(long id) {
    this.userRepository.deleteById(id);
  }

}
