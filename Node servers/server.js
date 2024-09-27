const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
//for python connection
const axios = require('axios');


const app = express();
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: true}));

// MySQL Connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'students'
});

db.connect((err) => {
  if (err) throw err;
  console.log('Connected to MySQL Database');
});

// Route to display main form
app.get('/', (req, res) => {
  res.render('index', { student: null, error: null });
});

// Route to handle search


app.post('/search', async (req, res) => {
    const enrollment_no = req.body.enrollment_no;  // Get the enrollment number from the request body

    // Send user input to Python API for SQL Injection & XSS detection
    try {
        const response = await axios.post('http://127.0.0.1:5000/detect', {
            enrollmentno: enrollment_no
        }, {
            headers: {
                'Content-Type': 'application/json'
            }
        });
        // If input is safe (is_safe === 0), proceed to search in the database
        if (response.data.is_safe === 0) {
            const query = 'SELECT * FROM student_details WHERE enrollment_no = ?';
            db.query(query, [enrollment_no], (err, results) => {
                if (err) throw err;

                if (results.length > 0) {
                    // Render the index page with student data if found
                    res.render('index', { student: results[0], error: null });
                } else {
                    // If no student found, render the page with an error message
                    res.render('index', { student: null, error: `Enrollment number ${enrollment_no} is not present in the database` });
                }
            });
        } else {
            // If SQL Injection or XSS is detected, show error message
            res.render('index', { student: null, error: 'SQL Injection or XSS detected. Input is not safe!' });
        }
    } catch (error) {
        // Handle any errors that occur during the request to the Python API or database query
        if (error.response) {
            console.error(`Error from API: ${error.response.status} - ${error.response.data}`);
            res.render('index', { student: null, error: `API returned an error: ${error.response.data}` });
        } else if (error.request) {
            console.error('No response received from the Python API');
            res.render('index', { student: null, error: 'No response from the Machine learning API' });
        } else {
            console.error('Error setting up the request:', error.message);
            res.render('index', { student: null, error: 'Error occurred while processing the request' });
        }
    }
});



app.listen(3000, () => {
  console.log('Server is running on port 3000');
});
