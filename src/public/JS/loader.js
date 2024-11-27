window.addEventListener("DOMContentLoaded", () =>{
    hideLoader(); 
    showLoader();
})

window.addEventListener("load", () =>{
    setTimeout(()=>{
   
        hideLoader(); 
    }, 1500);
})

const showLoader = () => {
    const loader = document.getElementById("loaderPagina");
    loader.classList.add("show_loader");
}
const hideLoader = () => {
    const loader = document.getElementById("loaderPagina");
    loader.classList.remove("show_loader");
}
