package za.ac.tut.u220390519.flightreservation.SecurityConfiguration;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import za.ac.tut.u220390519.flightreservation.model.User.User;
import za.ac.tut.u220390519.flightreservation.model.User.UserRepository;

import java.util.Optional;

@Service
public class MyUserDetailService implements UserDetailsService {

    final
    UserRepository userRepository;

    public MyUserDetailService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
       Optional<User> user  = userRepository.findByUsername(username);

        if(user == null){
            throw new UsernameNotFoundException("User not Found");
        }

        return user.map(MyUserDails::new).get();
    }
}
