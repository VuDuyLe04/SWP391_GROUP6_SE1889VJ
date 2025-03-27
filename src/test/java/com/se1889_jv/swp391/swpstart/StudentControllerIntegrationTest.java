package com.se1889_jv.swp391.swpstart;

import com.se1889_jv.swp391.swpstart.domain.Student;
import com.se1889_jv.swp391.swpstart.repository.StudentRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;
import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@Transactional
public class StudentControllerIntegrationTest {

    @Autowired
    private TestRestTemplate restTemplate;

    @Autowired
    private StudentRepository studentRepository;

    private Student testStudent;

    @BeforeEach
    public void setup() {
        studentRepository.deleteAll();
        testStudent = new Student();
        testStudent.setName("John Doe");
        testStudent.setAge(20);
        testStudent.setEmail("john.doe@example.com");
        testStudent = studentRepository.saveAndFlush(testStudent);
    }

    @Test
    public void testCreateStudent() {
        Map<String, Object> studentDto = new HashMap<>();
        studentDto.put("name", "Jane Doe");
        studentDto.put("age", 22);
        studentDto.put("email", "jane.doe@example.com");

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<Map<String, Object>> request = new HttpEntity<>(studentDto, headers);

        ResponseEntity<Student> response = restTemplate.postForEntity("/students", request, Student.class);
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.OK);
        assertThat(response.getBody()).isNotNull();
        assertThat(response.getBody().getName()).isEqualTo("Jane Doe");
    }

    @Test
    public void testGetStudentById() {
        ResponseEntity<Student> response = restTemplate.getForEntity("/students/" + testStudent.getId(), Student.class);
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.OK);
        assertThat(response.getBody()).isNotNull();
        assertThat(response.getBody().getName()).isEqualTo("John Doe");
    }

    @Test
    public void testUpdateStudent() {
        Map<String, Object> updateDto = new HashMap<>();
        updateDto.put("name", "Updated Name");
        updateDto.put("age", 25);
        updateDto.put("email", "updated.email@example.com");

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<Map<String, Object>> request = new HttpEntity<>(updateDto, headers);

        ResponseEntity<Student> response = restTemplate.exchange(
                "/students/" + testStudent.getId(), HttpMethod.PUT, request, Student.class);

        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.OK);
        assertThat(response.getBody()).isNotNull();
        assertThat(response.getBody().getName()).isEqualTo("Updated Name");
    }

    @Test
    public void testDeleteStudent() {
        ResponseEntity<Void> response = restTemplate.exchange(
                "/students/" + testStudent.getId(), HttpMethod.DELETE, null, Void.class);
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.NO_CONTENT);
        assertThat(studentRepository.existsById(testStudent.getId())).isFalse();
    }
}
