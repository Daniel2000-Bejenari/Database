//employee
db.employees.insertMany([
   {
      name: "Alice Smith",
      position: "Manager",
      department: "Marketing",
      salary: 60000,
      skills: ["marketing", "team management"],
      performanceReview: {
         rating: 4.5,
         notes: "Alice has done a great job leading the marketing team this year. She has implemented several successful campaigns and has effectively managed her team. There is room for improvement in her communication with other departments, however."
      }
   },
   {
      name: "Bob Johnson",
      position: "Developer",
      department: "IT",
      salary: 80000,
      skills: ["JavaScript", "Node.js", "React"],
      performanceReview: {
         rating: 4.0,
         notes: "Bob has made significant contributions to the development team this year. He has a strong understanding of the technologies he works with and consistently produces high-quality code. However, he could benefit from improving his communication with project managers and stakeholders."
      }
   },
   {
      name: "Charlie Williams",
      position: "Human Resources Manager",
      department: "Human Resources",
      salary: 65000,
      skills: ["HR", "recruiting", "training"],
      performanceReview: {
         rating: 4.75,
         notes: "Charlie has done an excellent job managing the HR team and handling HR issues this year. He has successfully recruited several key employees and implemented a new training program. He has a good understanding of company policies and is effective at enforcing them."
      }
   },
   {
      name: "Diana Davis",
      position: "Accountant",
      department: "Finance",
      salary: 55000,
      skills: ["accounting", "quickbooks"],
      performanceReview: {
         rating: 4.25,
         notes: "Diana has a strong understanding of accounting principles and has done a good job managing the company's finances this year. She is proficient in QuickBooks and has helped streamline several financial processes. However, she could benefit from improving her communication with other departments and being more proactive in addressing potential issues."
      }
   }])
   
// departments 
db.departments.insertMany([
   {
      name: "Marketing",
      location: "New York",
      budget: 200000,
      employees: [
         {
            name: "Alice Smith",
            position: "Manager"
         },
         {
            name: "Jane Doe",
            position: "Assistant Manager"
         },
         {
            name: "Jim Johnson",
            position: "Marketing Coordinator"
         }
      ]
   },
   {
      name: "IT",
      location: "San Francisco",
      budget: 300000,
      employees: [
         {
            name: "Bob Johnson",
            position: "Developer"
         },
         {
            name: "John Smith",
            position: "Systems Administrator"
         },
         {
            name: "Sarah Williams",
            position: "Developer"
         }
      ]
   },
   {
      name: "Human Resources",
      location: "Chicago",
      budget: 100000,
      employees: [
         {
            name: "Charlie Williams",
            position: "Human Resources Manager"
         },
         {
            name: "Linda Davis",
            position: "HR Coordinator"
         }
      ]
   },
   {
      name: "Finance",
      location: "New York",
      budget: 200000,
      employees: [
         {
            name: "Diana Davis",
            position: "Accountant"
         },
         {
            name: "Michael Rodriguez",
            position: "Finance Manager"
         }
      ]
   }
]);
// positions 
db.positions.insertMany([
   {
      title: "Manager",
      description: "Responsible for leading and managing a team within the company.",
      salaryRange: {
         min: 50000,
         max: 80000
      }
   },
   {
      title: "Developer",
      description: "Responsible for designing, developing, and maintaining software applications.",
      salaryRange: {
         min: 60000,
         max: 110000
      }
   },
   {
      title: "Human Resources Manager",
      description: "Responsible for overseeing the human resources function within the company.",
      salaryRange: {
         min: 50000,
         max: 90000
      }
   },
   {
      title: "Accountant",
      description: "Responsible for maintaining financial records and performing financial analyses.",
      salaryRange: {
         min: 40000,
         max: 75000
      }
   }
]);
//salaries
db.salaries.insertMany([
   {
      employee: {
         name: "Alice Smith",
         position: "Manager"
      },
      amount: 50000,
      date: ISODate("2022-01-01"),
      reason: "Monthly salary"
   },
   {
      employee: {
         name: "Bob Johnson",
         position: "Developer"
      },
      amount: 75000,
      date: ISODate("2022-01-01"),
      reason: "Monthly salary"
   },
   {
      employee: {
         name: "Charlie Williams",
         position: "Human Resources Manager"
      },
      amount: 65000,
      date: ISODate("2022-01-01"),
      reason: "Monthly salary"
   },
   {
      employee: {
         name: "Diana Davis",
         position: "Accountant"
      },
      amount: 55000,
      date: ISODate("2022-01-01"),
      reason: "Monthly salary"
   }
]);
// raises 
db.raises.insertMany([
   {
      employee: {
         name: "Alice Smith",
         position: "Manager"
      },
      amount: 5000,
      date: ISODate("2022-01-01"),
      reason: "Performance review"
   },
   {
      employee: {
         name: "Bob Johnson",
         position: "Developer"
      },
      amount: 10000,
      date: ISODate("2022-01-01"),
      reason: "Performance review"
   },
   {
      employee: {
         name: "Charlie Williams",
         position: "Human Resources Manager"
      },
      amount: 7500,
      date: ISODate("2022-01-01"),
      reason: "Performance review"
   },
   {
      employee: {
         name: "Diana Davis",
         position: "Accountant"
      },
      amount: 6500,
      date: ISODate("2022-01-01"),
      reason: "Performance review"
   }
]);
// bonuses 
db.bonuses.insertMany([
   {
      employee: {
         name: "Alice Smith",
         position: "Manager"
      },
      amount: 1000,
      date: ISODate("2022-01-01"),
      reason: "Performance bonus"
   },
   {
      employee: {
         name: "Bob Johnson",
         position: "Developer"
      },
      amount: 2000,
      date: ISODate("2022-01-01"),
      reason: "Performance bonus"
   },
   {
      employee: {
         name: "Charlie Williams",
         position: "Human Resources Manager"
      },
      amount: 1500,
      date: ISODate("2022-01-01"),
      reason: "Performance bonus"
   },
   {
      employee: {
         name: "Diana Davis",
         position: "Accountant"
      },
      amount: 1250,
      date: ISODate("2022-01-01"),
      reason: "Performance bonus"
   }
]);
// deductions 
db.deductions.insertMany([
   {
      employee: {
         name: "Alice Smith",
         position: "Manager"
      },
      amount: 250,
      date: ISODate("2022-01-01"),
      reason: "Health insurance premium"
   },
   {
      employee: {
         name: "Bob Johnson",
         position: "Developer"
      },
      amount: 500,
      date: ISODate("2022-01-01"),
      reason: "401(k) contribution"
   },
   {
      employee: {
         name: "Charlie Williams",
         position: "Human Resources Manager"
      },
      amount: 350,
      date: ISODate("2022-01-01"),
      reason: "Health insurance premium"
   },
   {
      employee: {
         name: "Diana Davis",
         position: "Accountant"
      },
      amount: 300,
      date: ISODate("2022-01-01"),
      reason: "401(k) contribution"
   }
]);
//taxes 
db.taxes.insertMany([
   {
      employee: {
         name: "Alice Smith",
         position: "Manager"
      },
      amount: 5000,
      date: ISODate("2022-01-01"),
      type: "Federal income tax"
   },
   {
      employee: {
         name: "Bob Johnson",
         position: "Developer"
      },
      amount: 7500,
      date: ISODate("2022-01-01"),
      type: "Federal income tax"
   },
   {
      employee: {
         name: "Charlie Williams",
         position: "Human Resources Manager"
      },
      amount: 6500,
      date: ISODate("2022-01-01"),
      type: "Federal income tax"
   },
   {
      employee: {
         name: "Diana Davis",
         position: "Accountant"
      },
      amount: 5500,
      date: ISODate("2022-01-01"),
      type: "Federal income tax"
   }
]);
