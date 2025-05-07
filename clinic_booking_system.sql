USE clinic_booking_system;
-- Create SPECIALTIES table
-- CREATE TABLE specialties (
--     specialty_id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(100) NOT NULL UNIQUE,
--     description TEXT
-- ) ENGINE=InnoDB;
-- Create DEPARTMENTS table
-- CREATE TABLE departments (
--     department_id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(100) NOT NULL UNIQUE,
--     description TEXT,
--     location VARCHAR(100)
-- ) ENGINE=InnoDB;

--  Create STAFF table
-- CREATE TABLE staff (
--     staff_id INT AUTO_INCREMENT PRIMARY KEY,
--     full_name VARCHAR(100) NOT NULL,
--     gender VARCHAR(20),
--     role VARCHAR(50) NOT NULL,
--     specialty_id INT,
--     department_id INT,
--     phone VARCHAR(20) NOT NULL,
--     email VARCHAR(100) UNIQUE NOT NULL,
--     shift_start TIME,
--     shift_end TIME,
--     is_active BOOLEAN DEFAULT TRUE,
--     created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
--     updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--     FOREIGN KEY (specialty_id) REFERENCES specialties(specialty_id) ON DELETE SET NULL,
--     FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE SET NULL
-- ) ENGINE=InnoDB;

-- Create PATIENTS table
-- CREATE TABLE patients (
--     patient_id INT AUTO_INCREMENT PRIMARY KEY,
--     full_name VARCHAR(100) NOT NULL,
--     date_of_birth DATE NOT NULL,
--     gender VARCHAR(20),
--     address VARCHAR(255),
--     phone VARCHAR(20) NOT NULL,
--     email VARCHAR(100) UNIQUE,
--     emergency_contact VARCHAR(100),
--     medical_history TEXT,
--     insurance_details VARCHAR(255),
--     created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
--     updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
-- ) ENGINE=InnoDB;

-- Create ROOMS table
-- CREATE TABLE rooms (
--     room_id INT AUTO_INCREMENT PRIMARY KEY,
--     room_number VARCHAR(20) NOT NULL UNIQUE,
--     room_type VARCHAR(50) NOT NULL,
--     capacity INT DEFAULT 1,
--     is_available BOOLEAN DEFAULT TRUE
-- ) ENGINE=InnoDB;

-- Create SERVICES table
-- CREATE TABLE services (
--     service_id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(100) NOT NULL UNIQUE,
--     description TEXT,
--     cost DECIMAL(10, 2) NOT NULL,
--     duration_minutes INT NOT NULL
-- ) ENGINE=InnoDB;
-- Create PAYMENT_METHODS table
-- CREATE TABLE payment_methods (
--     payment_method_id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(50) NOT NULL UNIQUE,
--     is_active BOOLEAN DEFAULT TRUE
-- ) ENGINE=InnoDB;

-- -- Create APPOINTMENTS table
-- CREATE TABLE appointments (
--     appointment_id INT AUTO_INCREMENT PRIMARY KEY,
--     patient_id INT NOT NULL,
--     staff_id INT NOT NULL,
--     room_id INT,
--     appointment_time DATETIME NOT NULL,
--     duration_minutes INT NOT NULL DEFAULT 30,
--     status VARCHAR(20) NOT NULL DEFAULT 'Scheduled',
--     notes TEXT,
--     created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
--     updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--     canceled_at DATETIME,
--     CHECK (status IN ('Scheduled', 'Confirmed', 'Completed', 'Canceled', 'No-Show')),
--     FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE,
--     FOREIGN KEY (staff_id) REFERENCES staff(staff_id) ON DELETE CASCADE,
--     FOREIGN KEY (room_id) REFERENCES rooms(room_id) ON DELETE SET NULL
-- ) ENGINE=InnoDB;

-- -- Create APPOINTMENT_SERVICES junction table
-- CREATE TABLE appointment_services (
--     appointment_service_id INT AUTO_INCREMENT PRIMARY KEY,
--     appointment_id INT NOT NULL,
--     service_id INT NOT NULL,
--     cost_applied DECIMAL(10, 2) NOT NULL,
--     FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id) ON DELETE CASCADE,
--     FOREIGN KEY (service_id) REFERENCES services(service_id) ON DELETE CASCADE
-- ) ENGINE=InnoDB;

-- -- Create MEDICAL_RECORDS table
-- CREATE TABLE medical_records (
--     record_id INT AUTO_INCREMENT PRIMARY KEY,
--     appointment_id INT NOT NULL,
--     diagnosis TEXT,
--     prescription TEXT,
--     treatment_notes TEXT,
--     created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
--     updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--     FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id) ON DELETE CASCADE
-- ) ENGINE=InnoDB;

-- -- Create PAYMENTS table
-- CREATE TABLE payments (
--     payment_id INT AUTO_INCREMENT PRIMARY KEY,
--     appointment_id INT NOT NULL,
--     amount DECIMAL(10, 2) NOT NULL,
--     payment_method_id INT NOT NULL,
--     status VARCHAR(20) NOT NULL DEFAULT 'Pending',
--     payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
--     transaction_reference VARCHAR(100) UNIQUE,
--     CHECK (status IN ('Pending', 'Completed', 'Failed', 'Refunded')),
--     FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id) ON DELETE CASCADE,
--     FOREIGN KEY (payment_method_id) REFERENCES payment_methods(payment_method_id) ON DELETE RESTRICT
-- ) ENGINE=InnoDB;

-- -- Create Indexes for performance optimization
-- CREATE INDEX idx_appointments_patient ON appointments(patient_id);
-- CREATE INDEX idx_appointments_staff ON appointments(staff_id);
-- CREATE INDEX idx_appointments_date ON appointments(appointment_time);
-- CREATE INDEX idx_staff_specialty ON staff(specialty_id);
-- CREATE INDEX idx_staff_department ON staff(department_id);
-- CREATE INDEX idx_medical_records_appointment ON medical_records(appointment_id);
-- CREATE INDEX idx_payments_appointment ON payments(appointment_id);

-- -- Insert sample data for SPECIALTIES
-- INSERT INTO specialties (name, description) VALUES
-- ('General Medicine', 'Deals with diagnosis and treatment of general health issues'),
-- ('Cardiology', 'Specializes in heart-related diseases and treatments'),
-- ('Pediatrics', 'Medical care for infants, children, and adolescents'),
-- ('Dermatology', 'Focuses on skin-related conditions and treatments'),
-- ('Orthopedics', 'Deals with musculoskeletal system disorders');

-- -- Insert sample data for DEPARTMENTS
-- INSERT INTO departments (name, description, location) VALUES
-- ('General Practice', 'Primary care services', 'First Floor'),
-- ('Specialized Care', 'Advanced medical treatments', 'Second Floor'),
-- ('Emergency', 'Urgent medical attention', 'Ground Floor'),
-- ('Diagnostics', 'Medical tests and diagnostics', 'Third Floor'),
-- ('Rehabilitation', 'Recovery and physical therapy', 'Fourth Floor');

-- Insert sample data for ROOMS
-- INSERT INTO rooms (room_number, room_type, capacity, is_available) VALUES
-- ('A101', 'Examination', 1, TRUE),
-- ('A102', 'Examination', 1, TRUE),
-- ('B201', 'Treatment', 2, TRUE),
-- ('C301', 'Surgery', 5, TRUE),
-- ('D401', 'Recovery', 3, TRUE);

--  Insert sample data for PAYMENT_METHODS
-- INSERT INTO payment_methods (name, is_active) VALUES
-- ('Cash', TRUE),
-- ('Credit Card', TRUE),
-- ('Insurance', TRUE),
-- ('Mobile Payment', TRUE),
-- ('Bank Transfer', TRUE);

--  Insert sample data for SERVICES
-- INSERT INTO services (name, description, cost, duration_minutes) VALUES
-- ('Regular Checkup', 'General health assessment', 50.00, 30),
-- ('Blood Test', 'Complete blood analysis', 35.00, 15),
-- ('X-Ray', 'Radiographic imaging', 120.00, 20),
-- ('Physical Therapy', 'Rehabilitation session', 80.00, 60),
-- ('Vaccination', 'Preventive immunization', 25.00, 10);

--  Insert sample data for STAFF
-- INSERT INTO staff (full_name, gender, role, specialty_id, department_id, phone, email, shift_start, shift_end, is_active) VALUES
-- ('Dr. John Smith', 'Male', 'Doctor', 1, 1, '555-123-4567', 'jsmith@clinic.com', '08:00:00', '17:00:00', TRUE),
-- ('Dr. Sarah Johnson', 'Female', 'Doctor', 2, 2, '555-234-5678', 'sjohnson@clinic.com', '09:00:00', '18:00:00', TRUE),
-- ('Dr. Michael Brown', 'Male', 'Doctor', 3, 1, '555-345-6789', 'mbrown@clinic.com', '08:00:00', '16:00:00', TRUE),
-- ('Nurse Emma Davis', 'Female', 'Nurse', NULL, 3, '555-456-7890', 'edavis@clinic.com', '07:00:00', '15:00:00', TRUE),
-- ('Nurse Robert Wilson', 'Male', 'Nurse', NULL, 2, '555-567-8901', 'rwilson@clinic.com', '12:00:00', '20:00:00', TRUE);

-- Insert sample data for PATIENTS
-- INSERT INTO patients (full_name, date_of_birth, gender, address, phone, email, emergency_contact, medical_history, insurance_details) VALUES
-- ('Alice Thompson', '1985-07-15', 'Female', '123 Main St, Anytown', '555-111-2222', 'alice@email.com', 'Bob Thompson 555-222-3333', 'Allergic to penicillin', 'HealthPlus #12345'),
-- ('James Wilson', '1978-03-22', 'Male', '456 Elm St, Somecity', '555-333-4444', 'james@email.com', 'Mary Wilson 555-444-5555', 'Hypertension', 'MediCare #67890'),
-- ('Maria Garcia', '1992-11-08', 'Female', '789 Oak Ave, Otherville', '555-555-6666', 'maria@email.com', 'Carlos Garcia 555-666-7777', 'None', 'InsureCo #13579'),
-- ('David Lee', '1965-05-30', 'Male', '321 Pine Rd, Lasttown', '555-777-8888', 'david@email.com', 'Susan Lee 555-888-9999', 'Type 2 diabetes', 'HealthShield #24680'),
-- ('Emily Chen', '2000-01-25', 'Female', '654 Cedar Ln, Newplace', '555-999-0000', 'emily@email.com', 'John Chen 555-000-1111', 'Asthma', 'CarePlus #35791');

--  Insert sample data for APPOINTMENTS
-- INSERT INTO appointments (patient_id, staff_id, room_id, appointment_time, duration_minutes, status, notes) VALUES
-- (1, 1, 1, '2025-05-10 09:00:00', 30, 'Confirmed', 'Regular checkup'),
-- (2, 2, 2, '2025-05-10 10:00:00', 45, 'Scheduled', 'Follow-up on heart condition'),
-- (3, 3, 3, '2025-05-11 14:00:00', 60, 'Confirmed', 'Treatment session'),
-- (4, 1, 1, '2025-05-12 15:30:00', 30, 'Scheduled', 'Diabetes monitoring'),
-- (5, 2, 2, '2025-05-08 11:00:00', 30, 'Completed', 'Asthma check'),
-- (1, 3, 3, '2025-05-07 10:00:00', 45, 'Canceled', 'Patient called to reschedule');

--  Insert sample data for APPOINTMENT_SERVICES
-- INSERT INTO appointment_services (appointment_id, service_id, cost_applied) VALUES
-- (1, 1, 50.00),  -- Alice's regular checkup
-- (2, 2, 35.00),  -- James's blood test
-- (2, 3, 120.00), -- James's X-Ray
-- (3, 4, 80.00),  -- Maria's physical therapy
-- (4, 1, 50.00),  -- David's regular checkup
-- (5, 1, 50.00),  -- Emily's regular checkup
-- (5, 5, 25.00);  -- Emily's vaccination

--  Insert sample data for MEDICAL_RECORDS
-- INSERT INTO medical_records (appointment_id, diagnosis, prescription, treatment_notes) VALUES
-- (1, 'Healthy, no concerns', NULL, 'Patient is in good health. Recommended annual checkup.'),
-- (2, 'Mild hypertension', 'Lisinopril 10mg daily', 'Blood pressure slightly elevated. Scheduled follow-up in 3 months.'),
-- (3, 'Muscle strain', 'Ibuprofen 400mg as needed', 'Recommended physical therapy twice weekly for 3 weeks.'),
-- (5, 'Controlled asthma', 'Albuterol inhaler as needed', 'Lung function tests normal. Continue current management plan.');

-- -- Insert sample data for PAYMENTS
-- INSERT INTO payments (appointment_id, amount, payment_method_id, status, transaction_reference) VALUES
-- (1, 50.00, 2, 'Pending', 'TXN-001-2025'),
-- (2, 155.00, 3, 'Completed', 'TXN-002-2025'),
-- (3, 80.00, 1, 'Completed', 'TXN-003-2025'),
-- (5, 75.00, 4, 'Completed', 'TXN-004-2025');

--  Create a procedure to check room availability for appointments
-- DELIMITER //
-- CREATE PROCEDURE check_room_availability(IN p_room_id INT, IN p_start_time DATETIME, IN p_duration_minutes INT)
-- BEGIN
--     DECLARE room_is_available BOOLEAN;
--     
--     SELECT COUNT(*) = 0 INTO room_is_available
--     FROM appointments a
--     WHERE a.room_id = p_room_id
--       AND a.status NOT IN ('Canceled', 'No-Show')
--       AND ((p_start_time BETWEEN a.appointment_time AND DATE_ADD(a.appointment_time, INTERVAL a.duration_minutes MINUTE))
--            OR (DATE_ADD(p_start_time, INTERVAL p_duration_minutes MINUTE) BETWEEN a.appointment_time AND DATE_ADD(a.appointment_time, INTERVAL a.duration_minutes MINUTE))
--            OR (p_start_time <= a.appointment_time AND DATE_ADD(p_start_time, INTERVAL p_duration_minutes MINUTE) >= DATE_ADD(a.appointment_time, INTERVAL a.duration_minutes MINUTE)));
--     
--     SELECT room_is_available;
-- END//
-- DELIMITER ;

-- -- Create a procedure to check staff availability for appointments
-- DELIMITER //
-- CREATE PROCEDURE check_staff_availability(IN p_staff_id INT, IN p_start_time DATETIME, IN p_duration_minutes INT)
-- BEGIN
--     DECLARE staff_is_available BOOLEAN;
--     DECLARE staff_shift_start TIME;
--     DECLARE staff_shift_end TIME;
--     
--     -- Get staff shift times
--     SELECT shift_start, shift_end INTO staff_shift_start, staff_shift_end
--     FROM staff
--     WHERE staff_id = p_staff_id;
    
    -- Check if appointment time is within staff shift
    SET @appointment_time_only = TIME(p_start_time);
    SET @shift_check = (@appointment_time_only >= staff_shift_start AND 
                    ADDTIME(@appointment_time_only, SEC_TO_TIME(p_duration_minutes * 60)) <= staff_shift_end);
    
    -- Check if staff has no overlapping appointments
    SELECT COUNT(*) = 0 AND @shift_check INTO staff_is_available
    FROM appointments a
    WHERE a.staff_id = p_staff_id
      AND a.status NOT IN ('Canceled', 'No-Show')
      AND ((p_start_time BETWEEN a.appointment_time AND DATE_ADD(a.appointment_time, INTERVAL a.duration_minutes MINUTE))
           OR (DATE_ADD(p_start_time, INTERVAL p_duration_minutes MINUTE) BETWEEN a.appointment_time AND DATE_ADD(a.appointment_time, INTERVAL a.duration_minutes MINUTE))
           OR (p_start_time <= a.appointment_time AND DATE_ADD(p_start_time, INTERVAL p_duration_minutes MINUTE) >= DATE_ADD(a.appointment_time, INTERVAL a.duration_minutes MINUTE)));
    
    SELECT staff_is_available;
END//
DELIMITER ;

-- Create a trigger to update room availability when appointment is created/updated
DELIMITER //
CREATE TRIGGER after_appointment_insert
AFTER INSERT ON appointments
FOR EACH ROW
BEGIN
    -- Mark room as unavailable during the appointment
    IF NEW.status NOT IN ('Canceled', 'No-Show') AND NEW.room_id IS NOT NULL THEN
        UPDATE rooms SET is_available = FALSE WHERE room_id = NEW.room_id;
    END IF;
END//

CREATE TRIGGER after_appointment_update
AFTER UPDATE ON appointments
FOR EACH ROW
BEGIN
    -- Update room availability based on appointment status
    IF NEW.status IN ('Canceled', 'No-Show', 'Completed') AND NEW.room_id IS NOT NULL THEN
        UPDATE rooms SET is_available = TRUE WHERE room_id = NEW.room_id;
    ELSEIF NEW.status NOT IN ('Canceled', 'No-Show') AND NEW.room_id IS NOT NULL THEN
        UPDATE rooms SET is_available = FALSE WHERE room_id = NEW.room_id;
    END IF;
END//
DELIMITER ;

-- Create a view to see upcoming appointments with patient and staff details
CREATE VIEW upcoming_appointments AS
SELECT 
    a.appointment_id,
    p.full_name AS patient_name,
    s.full_name AS staff_name,
    sp.name AS specialty,
    r.room_number,
    a.appointment_time,
    a.duration_minutes,
    a.status
FROM 
    appointments a
    JOIN patients p ON a.patient_id = p.patient_id
    JOIN staff s ON a.staff_id = s.staff_id
    LEFT JOIN specialties sp ON s.specialty_id = sp.specialty_id
    LEFT JOIN rooms r ON a.room_id = r.room_id
WHERE 
    a.appointment_time >= CURRENT_TIMESTAMP
    AND a.status NOT IN ('Canceled', 'Completed', 'No-Show')
ORDER BY 
    a.appointment_time;

-- Create a view for financial reports
CREATE VIEW financial_summary AS
SELECT 
    MONTH(p.payment_date) AS month,
    YEAR(p.payment_date) AS year,
    SUM(p.amount) AS total_income,
    COUNT(DISTINCT p.appointment_id) AS paid_appointments,
    AVG(p.amount) AS average_payment
FROM 
    payments p
WHERE 
    p.status = 'Completed'
GROUP BY 
    YEAR(p.payment_date),
    MONTH(p.payment_date)
ORDER BY 
    year, month;