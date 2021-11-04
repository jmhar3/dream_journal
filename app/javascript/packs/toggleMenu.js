document.getElementById("menu").addEventListener('click', toggleDropdown)

function toggleDropdown(e) {
    console.log('bye')
    if (e.target.classList.contains('toggle_menu')) {
        document.getElementById("nav-dropdown").classList.toggle("hide");
    }
}

console.log('hi')