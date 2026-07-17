document.addEventListener("DOMContentLoaded", () => {

    /* ==========================================
       ELEMENTS
    ========================================== */

    const calendarEl = document.getElementById("calendar");
    const calendarTitle = document.getElementById("calendar-title");

    const prevBtn = document.getElementById("prev-month");
    const nextBtn = document.getElementById("next-month");
    const todayBtn = document.getElementById("today-btn");


    /* ==========================================
       CALENDAR
    ========================================== */

    const calendar = new FullCalendar.Calendar(calendarEl, {

        initialView: "dayGridMonth",
        headerToolbar: false,
        height: "auto"

    });


    /* ==========================================
       FUNCTIONS
    ========================================== */

    function updateCalendarTitle() {

        calendarTitle.textContent = calendar.view.title;

    }

    function navigateCalendar(action) {

        action();
        updateCalendarTitle();

    }


    /* ==========================================
       INITIALIZATION
    ========================================== */

    calendar.render();
    updateCalendarTitle();


    /* ==========================================
       EVENT LISTENERS
    ========================================== */

    prevBtn.addEventListener("click", () =>
        navigateCalendar(() => calendar.prev())
    );

    nextBtn.addEventListener("click", () =>
        navigateCalendar(() => calendar.next())
    );

    todayBtn.addEventListener("click", () =>
        navigateCalendar(() => calendar.today())
    );

});