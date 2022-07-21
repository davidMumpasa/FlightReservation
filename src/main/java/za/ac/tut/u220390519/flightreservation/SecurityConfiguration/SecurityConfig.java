package za.ac.tut.u220390519.flightreservation.SecurityConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AndRequestMatcher;


@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    final
    UserDetailsService userDetailsService;

    public SecurityConfig(UserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
         auth.userDetailsService(userDetailsService);
    }

    /* @Bean
    AuthenticationProvider authenticationProvider(){
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();

        provider.setUserDetailsService(userDetailsService);
        provider.setPasswordEncoder(new BCryptPasswordEncoder());

        return provider;

    }*/

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();

       http.authorizeHttpRequests()

               .antMatchers("/admin").hasAuthority("admin")
               .antMatchers("/addUser").permitAll()
               .antMatchers("/Signing").permitAll()
               .antMatchers("/home").hasAuthority("user")
               .antMatchers("/bookTicket").hasAuthority("user")
               .antMatchers("/makePayment").hasAuthority("user")
               .antMatchers("/allFlight").hasAuthority("user")
               .antMatchers("/admin").hasAuthority("admin")
               .antMatchers("/addFlightDb").hasAuthority("/admin")
               .antMatchers("/flightReport").hasAuthority("admin")
               .and().formLogin()//.loginPage("/login")
               .permitAll()
               .and().
               logout().permitAll();
               //.clearAuthentication(true)
               //.logoutRequestMatcher(new AndRequestMatcher("/logout"))
               //logoutSuccessUrl("/login").permitAll();

    }


    @Bean
    public PasswordEncoder getPasswordEncoder(){
        return NoOpPasswordEncoder.getInstance();
    }

}
