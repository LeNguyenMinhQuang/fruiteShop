package vn.fruitshop.quang.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.fruitshop.quang.domain.User;
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

  // Admin

  public User handleSaveUser(User newUser) {
    User user = this.userRepository.save(newUser);
    return user;
  }

  public List<User> handleGetAllUsers() {
    return this.userRepository.findAll();
  }

  public User handleGetUserById(long id) {
    return this.userRepository.findById(id);
  }

  public User handleGetUserByEmail(String email) {
    return this.userRepository.findFirstByEmail(email);
  }

}
