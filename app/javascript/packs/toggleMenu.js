document.getElementById("menu").addEventListener('click', toggleDropdown)

function toggleDropdown(e) {
    if (e.target.classList.contains('toggle_menu')) {
        document.getElementById("nav-dropdown").classList.toggle("hide");
    } else if (e.target.classList.contains('toggle_tracker_menu')) {
        document.getElementById("tracker-dropdown").classList.toggle("hide");
    }
}