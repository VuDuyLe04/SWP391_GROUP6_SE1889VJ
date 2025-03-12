package com.se1889_jv.swp391.swpstart.config;

//import com.se1889_jv.swp391.swpstart.service.CustomUserDetailsService;

import com.se1889_jv.swp391.swpstart.service.CustomUserDetailsService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import jakarta.servlet.DispatcherType;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.session.security.web.authentication.SpringSessionRememberMeServices;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfiguration {
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public UserDetailsService userDetailsService(UserService userService) {
        return new CustomUserDetailsService(userService);
    }

    @Bean
    public DaoAuthenticationProvider authProvider(
            PasswordEncoder passwordEncoder,
            UserDetailsService userDetailsService) {

        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService);
        authProvider.setPasswordEncoder(passwordEncoder);
        // authProvider.setHideUserNotFoundExceptions(false);

        return authProvider;
    }

    @Bean
    public SpringSessionRememberMeServices rememberMeServices() {
        SpringSessionRememberMeServices rememberMeServices = new SpringSessionRememberMeServices();
        // optionally customize
        rememberMeServices.setAlwaysRemember(true);
        return rememberMeServices;
    }

    @Bean
    public AuthenticationSuccessHandler customSuccessHandler(UserService userService) {
        return new CustomSuccessHandler(userService);
    }
//
//
//    //Don't touch please
//    @Bean
//    SecurityFilterChain filterChain(HttpSecurity http, UserService userService) throws Exception {
//        UserService userService1 = null;
//        http
//                .authorizeHttpRequests(authorize -> authorize
//                        .dispatcherTypeMatchers(DispatcherType.FORWARD,
//                                DispatcherType.INCLUDE)
//                        .permitAll()
//
//                        .requestMatchers("/**", "/login", "/product/**", "/client/**", "/css/**", "/js/**", "/images/**")
//                        .permitAll()
//
//                        .requestMatchers("/admin/**").hasRole("ADMIN")
//                        .anyRequest().authenticated()
//
//                )
//
//                .sessionManagement((sessionManagement) -> sessionManagement
//                        .sessionCreationPolicy(SessionCreationPolicy.ALWAYS)
//                        .invalidSessionUrl("/logout?expired")
//                        .maximumSessions(1)
//                        .maxSessionsPreventsLogin(false))
//
//                .logout(logout -> logout.deleteCookies("JSESSIONID").invalidateHttpSession(true))
//
//                .rememberMe(r -> r.rememberMeServices(rememberMeServices()))
//
//                .formLogin(formLogin -> formLogin
//                        .loginPage("/login")
//                        .failureUrl("/login?error")
//                        .successHandler(customSuccessHandler(userService1))
//                        .permitAll())
//                .exceptionHandling(ex -> ex.accessDeniedPage("/access-deny"));
//
//        return http.build();
//    }

//Don't touch please
@Bean
SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
    UserService userService1 = null;
    http
            .authorizeHttpRequests(authorize -> authorize
                    .dispatcherTypeMatchers(DispatcherType.FORWARD,
                            DispatcherType.INCLUDE).permitAll()

                    .requestMatchers("/", "/login", "/register", "/client/**", "/admin/**", "/api/**").permitAll()
                            .requestMatchers("/customer", "/customer/**").hasAnyRole("STAFF", "OWNER")
                            .requestMatchers("/warehouse", "/warehouse/**", "/product", "/product/**","/payment", "/payment/history").hasRole("OWNER")

                            .requestMatchers("/profile/**").hasAnyRole("ADMIN", "STAFF", "OWNER")
//                    .requestMatchers("/customer/**", "/product/**").hasRole("OWNER")
                            .requestMatchers("/service/**").hasRole("ADMIN")
                            .anyRequest().authenticated()
            )

            .sessionManagement((sessionManagement) -> sessionManagement
                        .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
                        .invalidSessionUrl("/logout?expired")
                        .maximumSessions(1)
                        .maxSessionsPreventsLogin(false))
            .logout(logout -> logout.deleteCookies("JSESSIONID").invalidateHttpSession(true))
            .rememberMe(r -> r.rememberMeServices(rememberMeServices()))
            .formLogin(formLogin -> formLogin
                    .loginPage("/login")
                    .failureUrl("/login?error")
                    .successHandler(customSuccessHandler(userService1))
                    .permitAll())
            .exceptionHandling(ex -> ex.accessDeniedPage("/access-deny"));
    return http.build();
}


}
