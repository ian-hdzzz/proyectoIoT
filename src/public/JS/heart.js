 // Seleccionar el elemento BPM
 const bpmElement = document.getElementById('bpm');

 // Función para generar un nuevo BPM aleatorio
 function updateBPM() {
   const randomBPM = Math.floor(Math.random() * (120 - 60 + 1)) + 60; // Entre 60 y 120 BPM
   bpmElement.textContent = `${randomBPM} bpm`;
 }



// Obtenemos las variables de ubidots
// const TOKEN = "BBUS-df630tOmrq77nrKFPramhMfNPHjjcf"; // Reemplaza con tu token
// const VARIABLE_ID = "674748e4383d36046fd90b62"; // Reemplaza con el ID de la variable

// async function fetchVariable() {
//     try {
//         const response = await fetch(`https://industrial.api.ubidots.com/api/v1.6/variables/$6746a2d02fa4001329148a7e/values`, {
//             method: "GET",
//             headers: {
//                 "X-Auth-Token": TOKEN,
//                 "Content-Type": "application/json"
//             }
//         });

//         const data = await response.json();
//         const value = data.results[0]?.value || 0; // Valor más reciente
//         return value;
//     } catch (error) {
//         console.error("Error al obtener datos de Ubidots:", error);
//         return 0;
//     }
// }

// // Actualizamos barra
// async function updateProgressBar() {
//     const value = await fetchVariable(); // Obtiene el valor desde Ubidots
//     const percentage = Math.min(Math.max(value, 0), 100); // Asegúrate de que esté entre 0 y 100

//     const progressBar = document.getElementById("progressBar");
//     const progressText = document.getElementById("progressText");

//     // Actualizar el tamaño y el color
//     progressBar.style.height = `${percentage}%`;

//     if (percentage <= 40) {
//         progressBar.style.backgroundColor = "green";
//     } else if (percentage <= 70) {
//         progressBar.style.backgroundColor = "yellow";
//     } else {
//         progressBar.style.backgroundColor = "red";
//     }

    // Actualizar el texto
//     progressText.textContent = `${percentage}%`;
// }

// // Actualizar la barra de progreso cada 5 segundos
// setInterval(updateProgressBar, 2000);

//  Actualizar cada 2 segundos
 setInterval(updateBPM, 8000);
         // Función para actualizar el progreso
         function updateProgress(percentage) {
            const progressBar = document.getElementById("progressBar");
            const progressText = document.getElementById("progressText");

            // Cambiar la altura de la barra
            progressBar.style.height = `${percentage}%`;

            // Cambiar color según porcentaje
            if (percentage <= 40) {
                progressBar.style.backgroundColor = "green";
            } else if (percentage <= 70) {
                progressBar.style.backgroundColor = "yellow";
            } else {
                progressBar.style.backgroundColor = "red";
            }

            // Actualizar el texto
            progressText.textContent = `${percentage}%`;
        }

        // Simulación dinámica del porcentaje
        let percentage = 0;
        const interval = setInterval(() => {
            percentage = Math.floor(Math.random() * 101); // Genera un porcentaje aleatorio entre 0 y 100
            updateProgress(percentage);
        }, 2000); // Cambia cada 2 segundos|