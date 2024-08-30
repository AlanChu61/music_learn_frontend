## Front-End Plan (Flutter)

### 1. User Authentication (Sign Up, Login, Logout)

- **Sign Up Screen**:
  - **Description**: Create a sign-up screen with fields for name, email, and password.
  - **Implementation**:
    - Use Flutter’s `TextFormField` widgets to capture input.
    - Validate inputs before sending them to the back-end API.
    - Handle successful sign-up and error states.
  - **Future**: Implement third-party login (Firebase, Google, etc.).

- **Login Screen**:
  - **Description**: Create a login screen with fields for email and password.
  - **Implementation**:
    - Capture user input and send it to the back-end API for validation.
    - On successful login, navigate to the student or teacher dashboard based on the user role.
  - **Logout**:
    - Clear user session or token upon logout and redirect to the login screen.

### 2. Student Dashboard

- **Description**: After login, students are directed to their dashboard.
- **Features**:
  - Display student’s name, email, and profile photo.
  - Provide an option to upload a profile photo using `ImagePicker`.
  - Below the profile section, display two buttons:
    - **Course**: Navigate to the course page.
    - **Student Info**: Display personal information.

### 3. Student Course Page

- **Description**: Show a list of courses with details like schedule, instrument, and teacher.
- **Features**:
  - List all courses the student is enrolled in.
  - Provide an upload button for each course to submit music files.
  - Options to re-upload or delete the submitted music files.

### 4. Teacher Dashboard

- **Description**: After login, teachers are directed to their dashboard.
- **Features**:
  - Similar to the student dashboard but includes additional options for managing student submissions.
  - Display teacher’s name, email, and profile photo.
  - List all assigned courses with student names and uploaded files.
