<section id="cases" class="relative">
  <div
    class="grid grid-cols-2 md:grid-cols-4 gap-y-6 gap-6 md:gap-4"
    id="case-grid"
  >
    % for case in portfolio_content['cases']:
      <div class="case-item">
        % include('elements/case_element', case=case)
      </div>
    % end
  </div>

  <div class="mt-6 text-center">
    <button
      id="toggle-cases"
      class=" text-myWhite text-sm  md:text-base font-bold font-oswald uppercase bg-myBlue py-3.5 px-10 rounded-md drop-shadow-xl transition ease-in-out duration-300 hover:scale-105"
    >
      Se flere cases
    </button>
  </div>
</section>

</section>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    const toggleButton = document.getElementById("toggle-cases");
    const caseItems = document.querySelectorAll("#case-grid .case-item");
    let expanded = false;
    const visibleCount = 8; 

    caseItems.forEach((item, index) => {
      if (index >= visibleCount) {
        item.style.display = "none";
      }
    });

    toggleButton.addEventListener("click", function () {
      expanded = !expanded;

      caseItems.forEach((item, index) => {
        if (index >= visibleCount) {
          item.style.display = expanded ? "block" : "none";
        }
      });

      toggleButton.textContent = expanded
        ? "Vis færre cases"
        : "Se flere cases";
    });
  });
</script>
