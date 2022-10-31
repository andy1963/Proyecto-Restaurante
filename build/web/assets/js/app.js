$(document).ready(function () {

    $(".hamburger").click(function () {
        if ($("body").hasClass("menu-left-opened")) {
            $(this).removeClass("is-active");
            $("body").removeClass("menu-left-opened");
            $("html").css("overflow", "auto");
        } else {
            $(this).addClass("is-active");
            $("body").addClass("menu-left-opened");
            $("html").css("overflow", "hidden");
        }
    });

    $("#show-hide-sidebar-toggle").on("click", function () {
        if (!$("body").hasClass("sidebar-hidden")) {
            $("body").addClass("sidebar-hidden");
        } else {
            $("body").removeClass("sidebar-hidden");
        }
    });
    
});