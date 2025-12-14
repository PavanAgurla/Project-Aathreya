package com.example.demo;
import org.junit.jupiter.api.Test;
import static org.assertj.core.api.Assertions.assertThat;
public class HelloControllerTest {
@Test
public void contextLoadsAndHelloWorks() {
HelloController c = new HelloController();
assertThat(c.hello()).isEqualTo("Hello from CI/CD demo!");
}
}
