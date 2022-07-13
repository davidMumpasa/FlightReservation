package za.ac.tut.u220390519.flightreservation.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    public void addUser(User user){
        userRepository.save(user);

    }

    public Optional<User> findUser(Long id){
       return userRepository.findById(id);
    }

    public List<User> getAllUsers(){
        List<User> users = new ArrayList<>();
        Iterator<User> userIterator = userRepository.findAll().iterator();

        while(userIterator.hasNext()){
            User user = userIterator.next();
            users.add(user);
        }

        return users;
    }

    public void deleteUser(User user){
        userRepository.delete(user);

    }
}
