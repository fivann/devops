In a CI/CD (Continuous Integration/Continuous Deployment) process, tests are typically run at different stages to ensure that the code is working correctly and to catch issues early in the development cycle. Here are some common stages at which different types of tests are run:

**Unit Testing:** 
Unit tests are typically run during the build stage, after the code is committed to the version control system. These tests focus on individual units or components of the code, and they are used to ensure that each component is working correctly.

**Integration Testing:** 
Integration tests are run after the code has been built and integrated with other components. These tests check that the different components of the code are working together as expected.

**Functional Testing:** 
Functional tests are run after the code has been deployed to a test environment. These tests check that the code is working as intended from the user's perspective, by testing the functionality of the application.

**Performance Testing:** 
Performance tests are also run in a test environment, these tests check that the application can handle the expected load and usage.

**Acceptance Testing:** 
Acceptance tests are run in a staging environment, before the code is deployed to production. These tests check that the code meets the acceptance criteria and that it is ready for production use.

**Smoke Testing:** 
Smoke tests are run after the code is deployed to production, these tests check that the basic functionality of the application is working as expected.

It's worth noting that the stages and the type of tests that run may vary depending on the organization, the complexity of the application, and the specific requirements. Additionally, some organizations run all these test types in parallel, on different environments, and on different stages of the pipeline.
