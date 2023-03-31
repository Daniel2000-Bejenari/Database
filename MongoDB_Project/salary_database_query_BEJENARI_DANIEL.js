
// BEJENARI DANIEL - find  - tote departamentele cu bugetul mai mare de 200 000 situate in New York 
db.departments.find({
   budget: { $gte: 200000 },
   location: "New York"
});


// BEJENARI DANIEL - find- toti angajatii care au salarii intre 50 000 si 75 000 
db.employees.find({
   salary: {
      $gte: 50000,
      $lte: 75000
   }
});
////// BEJENARI DANIEL - topuri - top 3 angajati pe baza scorului de performanta salariu pe fiecare departament care au capacitati javascript si node.js

db.employees.aggregate([
    {
        $match: {
            skills: { $in: ["JavaScript", "Node.js"] }
        }
    },
    {
        $project: {
            name: 1,
            department: 1,
            salary: 1,
            performanceReview: 1,
            performanceScore: { $multiply: [ "$performanceReview.rating", 0.01 ] }
        }
    },
    {
        $sort: {
            performanceScore: -1,
            salary: -1
        }
    },
    {
        $group: {
            _id: "$department",
            top_employees: {
                $push: {
                    name: "$name",
                    salary: "$salary",
                    performanceScore: "$performanceScore"
                }
            }
        }
    },
    {
        $project: {
            department: "$_id",
            top_employees: { $slice: ["$top_employees", 3] }
        }
    }
])

//// BEJENARI DANIEL - top - top developer pe baza de salariu pe departament
db.employees.aggregate([
    {
        $match: {
            position: "Developer"
        }
    },
    {
        $sort: {
            salary: -1
        }
    },
    {
        $group: {
            _id: "$department",
            top_earners: { $push: { name: "$name", salary: "$salary" } },
        }
    },
    {
        $project: {
            department: "$_id",
            top_earners: { $slice: ["$top_earners", 3] }
        }
    }
])



// BEJENARI DANIEL-  wind - salariu total obtinut de fiecare angajat
db.employees.aggregate([
   {
      $lookup: {
         from: "salaries",
         localField: "name",
         foreignField: "employee.name",
         as: "salary_info"
      }
   },
   {
      $unwind: "$salary_info"
   },
   {
      $group: {
         _id: "$name",
         totalSalary: { $sum: "$salary_info.amount" }
      }
   },
   {
      $project: {
         name: "$_id",
         totalSalary: 1,
         _id: 0
      }
   }
]);
// BEJENARI DANIEL- name, position, department, and location of all employees who work in departments located in New York.
db.employees.aggregate([
   {
      $lookup: {
         from: "departments",
         localField: "department",
         foreignField: "name",
         as: "department_info"
      }
   },
   {
      $unwind: "$department_info"
   },
   {
      $match: {
         "department_info.location": "New York"
      }
   },
   {
      $project: {
         name: 1,
         position: 1,
         department: 1,
         location: "$department_info.location",
         _id: 0
      }
   }
]);

// BEJENARI DANIEL- name, salary, raises, bonuses, deductions, taxes, total earnings, total deductions, and net pay for all employees, sorted by net pay in descending order.

db.employees.aggregate([
   {
      $lookup: {
         from: "salaries",
         localField: "name",
         foreignField: "employee.name",
         as: "salary_info"
      }
   },
   {
      $unwind: "$salary_info"
   },
   {
      $lookup: {
         from: "raises",
         localField: "name",
         foreignField: "employee.name",
         as: "raise_info"
      }
   },
   {
      $unwind: "$raise_info"
   },
   {
      $lookup: {
         from: "bonuses",
         localField: "name",
         foreignField: "employee.name",
         as: "bonus_info"
      }
   },
   {
      $unwind: "$bonus_info"
   },
   {
      $lookup: {
         from: "deductions",
         localField: "name",
         foreignField: "employee.name",
         as: "deduction_info"
      }
   },
   {
      $unwind: "$deduction_info"
   },
   {
      $lookup: {
         from: "taxes",
         localField: "name",
         foreignField: "employee.name",
         as: "tax_info"
      }
   },
   {
      $unwind: "$tax_info"
   },
   {
      $group: {
         _id: "$name",
         salary: { $sum: "$salary_info.amount" },
         raises: { $sum: "$raise_info.amount" },
         bonuses: { $sum: "$bonus_info.amount" },
         deductions: { $sum: "$deduction_info.amount" },
         taxes: { $sum: "$tax_info.amount" }
      }
   },
   {
      $project: {
         name: "$_id",
         salary: 1,
         raises: 1,
         bonuses: 1,
         deductions: 1,
         taxes: 1,
         totalEarnings: { $sum: ["$salary", "$raises", "$bonuses"] },
         totalDeductions: { $sum: ["$deductions", "$taxes"] },
         netPay: { $subtract: ["$totalEarnings", "$total deductions"] }
      }
   },
   {
      $project: {
         name: 1,
         salary: 1,
         raises: 1,
         bonuses: 1,
         deductions: 1,
         taxes: 1,
         totalEarnings: 1,
         totalDeductions: 1,
         netPay: 1,
         _id: 0
      }
   },
   {
      $sort: {
         netPay: -1
      }
   }
]);
    
// BEJENARI DANIEL- salariu mediu pe angajati din departamentul marketing 
db.employees.aggregate([
   {
      $match: {
         department: "Marketing"
      }
   },
   {
      $lookup: {
         from: "salaries",
         localField: "name",
         foreignField: "employee.name",
         as: "salary_info"
      }
   },
   {
      $unwind: "$salary_info"
   },
   {
      $group: {
         _id: "$department",
         averageSalary: { $avg: "$salary_info.amount" }
      }
   },
   {
      $project: {
         department: "$_id",
         averageSalary: 1,
         _id: 0
      }
   }
]);
//////// BEJENARI DANIEL- name, salary, deductions, taxes, deduction percentage, and tax percentage for all   
db.employees.aggregate([
   {
      $lookup: {
         from: "salaries",
         localField: "name",
         foreignField: "employee.name",
         as: "salary_info"
      }
   },
   {
      $unwind: "$salary_info"
   },
   {
      $lookup: {
         from: "deductions",
         localField: "name",
         foreignField: "employee.name",
         as: "deduction_info"
      }
   },
   {
      $unwind: "$deduction_info"
   },
   {
      $lookup: {
         from: "taxes",
         localField: "name",
         foreignField: "employee.name",
         as: "tax_info"
      }
   },
   {
      $unwind: "$tax_info"
   },
   {
      $project: {
         name: 1,
         salary: "$salary_info.amount",
         deductions: "$deduction_info.amount",
         taxes: "$tax_info.amount",
         deductionPercent: { $multiply: [{ $divide: ["$deduction_info.amount", "$salary_info.amount"] }, 100] },
         taxPercent: { $multiply: [{ $divide: ["$tax_info.amount", "$salary_info.amount"] }, 100] }
      }
   },
   {
      $project: {
         name: 1,
         salary: 1,
         deductions: 1,
         taxes: 1,
         deductionPercent: 1,
         taxPercent: 1,
         _id: 0
      }
   },
   {
      $sort: {
         salary: -1
      }
   }
]);

