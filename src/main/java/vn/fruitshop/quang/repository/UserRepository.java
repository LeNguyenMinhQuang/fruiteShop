package vn.fruitshop.quang.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import vn.fruitshop.quang.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>, JpaSpecificationExecutor<User> {

  // Save user: create + update
  User save(User newUser);

  // Find

  List<User> findAll();

  Page<User> findAll(Pageable pageable);

  User findById(long id);

  List<User> findByEmail(String email);

  User findFirstByEmail(String email); // findTop2, findTop3,...

  // Delete

  void deleteById(long id);

}
