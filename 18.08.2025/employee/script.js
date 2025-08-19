
    const form = document.getElementById('employeeForm');
    const nameInput = document.getElementById('name');
    const ageInput = document.getElementById('age');
    const positionInput = document.getElementById('position');
    const employeesContainer = document.getElementById('employeesContainer');

    let employees = JSON.parse(localStorage.getItem('employees')) || [];

    function renderEmployees() {
      employeesContainer.innerHTML = '';
      employees.forEach((emp, index) => {
        const empDiv = document.createElement('div');
        empDiv.className = 'employee';
        empDiv.innerHTML = `
          <h3>${emp.name}</h3>
          <p><strong>Age:</strong> ${emp.age}</p>
          <p><strong>Position:</strong> ${emp.position}</p>
          <div class="employee-buttons">
            <button onclick="editEmployee(${index})">Edit</button>
            <button onclick="deleteEmployee(${index})">Delete</button>
          </div>
        `;
        employeesContainer.appendChild(empDiv);
      });
    }

    form.addEventListener('submit', function(e) {
      e.preventDefault();
      const name = nameInput.value.trim();
      const age = ageInput.value.trim();
      const position = positionInput.value.trim();
      if (name && age && position) {
        employees.push({ name, age, position });
        localStorage.setItem('employees', JSON.stringify(employees));
        nameInput.value = '';
        ageInput.value = '';
        positionInput.value = '';
        renderEmployees();
      }
    });

    function deleteEmployee(index) {
      if (confirm('Are you sure you want to delete this employee?')) {
        employees.splice(index, 1);
        localStorage.setItem('employees', JSON.stringify(employees));
        renderEmployees();
      }
    }

    function editEmployee(index) {
      const emp = employees[index];
      nameInput.value = emp.name;
      ageInput.value = emp.age;
      positionInput.value = emp.position;
      employees.splice(index, 1);
      renderEmployees();
    }

    // Initial render
    renderEmployees();
