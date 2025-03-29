package vn.fruitshop.quang.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import vn.fruitshop.quang.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

  // Save user: create + update
  User save(User newUser);

  // Find

  List<User> findAll();

  User findById(long id);

  List<User> findByEmail(String email);

  User findFirstByEmail(String email);

}
