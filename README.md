
CLINIC BOOKING DATABASE SYSTEM 

A comprehensive MySQL database system designed for managing medical clinic operations, including patient appointments, staff scheduling, medical records, and payment processing.

Project Overview
The Clinic Booking System is a relational database solution that enables healthcare facilities to efficiently manage their day-to-day operations. This system handles all critical aspects of clinic management, from patient registration to appointment scheduling, medical record keeping, and financial transactions.

Key Features
Patient Management: Store comprehensive patient information including medical history and insurance details
Staff Management: Organize healthcare providers by specialties and departments with shift tracking
Appointment Scheduling: Book, track, and manage patient appointments with conflict prevention
Room Management: Track room availability and assignments
Service Catalog: Maintain a list of available medical services with pricing
Medical Records: Document diagnoses, prescriptions, and treatment notes
Payment Processing: Track payment transactions with multiple payment methods
Real-time Reporting: Built-in views for financial summaries and appointment schedules
Database Architecture
The system consists of 10 interconnected tables with proper relationships:

PATIENTS
STAFF
SPECIALTIES
DEPARTMENTS
APPOINTMENTS
ROOMS
SERVICES
APPOINTMENT_SERVICES
MEDICAL_RECORDS
PAYMENTS
PAYMENT_METHODS


Setup Instructions
Prerequisites

MySQL Server 5.7+ or MySQL 8.0+ installed
MySQL Workbench or similar MySQL client


Installation Steps
1.Clone the repository

git clone https://github.com/techwakanda/CLINIC-BOOKING-SYSTEM-.git
cd clinic-booking-system
2.Import the database
Using MySQL Workbench:
Open MySQL Workbench
Connect to your MySQL server
Go to Server → Data Import
Choose "Import from Self-Contained File" and select the clinic_booking_system.sql file
Start Import
Using command line:

mysql -u username -p < clinic_booking_system.sql

3.Verify installation

sql
USE clinic_booking_system;
SELECT * FROM upcoming_appointments;

Database Schema
The database includes:

Tables with proper constraints (Primary Keys, Foreign Keys, NOT NULL, UNIQUE)
Stored procedures for checking room and staff availability
Triggers for automatic room status updates
Views for common reporting needs
Indexes for performance optimization

Sample Queries
View all upcoming appointments
sql
SELECT * FROM upcoming_appointments;

Check room availability
sql
CALL check_room_availability(1, '2025-05-15 10:00:00', 30);

Check staff availability
sql
CALL check_staff_availability(1, '2025-05-15 10:00:00', 30);

View financial summary by month
sql
SELECT * FROM financial_summary;

Extending the System
This database can be integrated with:

i)Web or desktop applications using standard database connectors
ii)RESTful APIs for mobile application support
iii)Reporting tools for advanced analytics

Contribution
Feel free to fork this project and submit pull requests. For major changes, please open an issue first to discuss what you would like to change.
