document.getElementById('loginForm').addEventListener('submit', function(event) { 
    event.preventDefault(); // Evita que el formulario se envíe por defecto 

    // Obtiene los valores del formulario 
    const username = document.getElementById('username').value; 
    const password = document.getElementById('password').value; 

    // Verificar que los campos no estén vacíos antes de continuar 
    if (!username || !password) { 
        document.getElementById('errorMessage').textContent = 'Por favor, completa todos los campos'; 
        return; 
    } 

    // Intentar primero el login vía API 
    console.log('Intentando login con API con usuario:', username, 'y contraseña:', password); // Depura los valores enviados
    
    fetch('http://localhost:5000/auth/login', { 
        method: 'POST', 
        headers: { 
            'Content-Type': 'application/json' 
        }, 
        body: JSON.stringify({ 
            username: username, 
            password: password 
        }) 
    }) 
    .then(response => { 
        console.log('Estado de la respuesta de la API:', response.status); 
        return response.text();  // Convertir la respuesta a texto para depuración
    })
    .then(data => { 
        console.log('Datos recibidos de la API:', data); 
        if (data.includes('Bienvenido')) { 
            // Redirige al panel si el login con la API es exitoso
            window.location.href = 'panel.jsp'; 
        } else { 
            console.warn('Login fallido con la API. Intentando con la base de datos.'); 
            loginConBaseDeDatos(username, password); 
        } 
    })
    .catch(error => { 
        console.error('Error en la API:', error); 
        // Si hay un error con la API, intentar con la base de datos local
        loginConBaseDeDatos(username, password); 
    }); 
});

// Función para intentar login con la base de datos local 
function loginConBaseDeDatos(username, password) { 
    console.log('Intentando login con la base de datos con usuario:', username, 'y contraseña:', password); 
    
  fetch('http://localhost:8080/CompensApp/login', { 
    method: 'POST', 
    headers: { 
        'Content-Type': 'application/json' 
    }, 
    body: JSON.stringify({ 
        usuario: username, 
        contraseña: password 
    }) 
}) 
    .then(response => { 
        console.log('Respuesta del servidor BD:', response.status); 
        if (response.redirected) { 
            window.location.href = response.url; 
        } else if (response.ok) { 
            return response.json(); 
        } else { 
            console.error('Error en el servidor BD: Código de respuesta', response.status); 
            throw new Error('Login fallido con la base de datos'); 
        } 
    }) 
    .then(data => { 
        console.log('Datos recibidos de la BD:', data); 
        if (data && data.success) { 
            window.location.href = 'panel.jsp'; 
        } else { 
            console.warn('Credenciales incorrectas en la base de datos.'); 
            document.getElementById('errorMessage').textContent = 'Credenciales incorrectas o error en la autenticación'; 
        } 
    }) 
    .catch(error => { 
        console.error('Error en la autenticación local:', error); 
        document.getElementById('errorMessage').textContent = 'Error en el servidor. Intenta más tarde.'; 
    }); 
}