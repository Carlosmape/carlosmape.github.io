---
layout: default
title: Projects and use cases
description: In this section I will regularly upload some articles with interesting things I done
---
<div class="skills">
  <select id="filter-tags" class="skill-card backgrounded">
    <option value="">Type</option>
    {% for tag in site.tags %}
      <option value="{{tag[0]}}">{{tag[0]}}</option>
    {% endfor %}
  </select>
  <!-- Filter by Dynamic tags -->
  {% for hardskill in site.data %}
  <select id="filter-{{hardskill[0]}}" class="skill-card backgrounded">
    <option value="">{{hardskill[0] | capitalize}}</option>
    {% for skill in hardskill[1] %}
      <option value="{{ skill }}">{{ skill }}</option>
    {% endfor %}
  </select>
  {% endfor %}
</div>

# Projects and use cases
<div class="posts">
  {% for usecase in site.posts %}
    {% include post-card.html %}
  {% endfor %}
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
  // Define filter groups including dynamic filters
  const filterGroups = ['tags', 'categories' {%for hardskill in site.data%},'{{hardskill[0]}}'{%endfor%}];
  const projects = document.querySelectorAll('.post-card-wrapper'); // Select all post card wrappers

  // Function to get the selected value for a given filter group
  function getSelectedValue(group) {
    const selectElement = document.getElementById(`filter-${group}`);
    return selectElement ? selectElement.value.toLowerCase() : '';
  }

  // Function to filter projects
  function filterProjects() {
    const selectedFilters = {};

    // Gather selected filter values
    filterGroups.forEach(group => {
      selectedFilters[group] = getSelectedValue(group);
    });

    projects.forEach(project => {
      // Check if project matches all selected filters
      const projectTags = project.dataset.tags.toLowerCase().split('$').map(tag => tag.trim());
      const matchesTags = !selectedFilters.tags || projectTags.includes(selectedFilters.tags);
      
      // Check dynamic filters
      const matchesDynamicFilters = filterGroups.slice(2).every(group => {
        if (selectedFilters[group]) {
          const projectValues = project.dataset[group].toLowerCase().split('$').map(value => value.trim());
          return projectValues.includes(selectedFilters[group]);
        }
        return true; // If no filter is selected, match is true
      });

      // Show or hide project based on all filters
      if (matchesTags && matchesDynamicFilters) {
        project.style.display = 'block';
      } else {
        project.style.display = 'none';
      }
    });

    // Show or hide the "no results" message
    const visibleProjects = [...projects].filter(project => project.style.display === 'block');

    // Update URL parameters
    updateURL(selectedFilters);
  }

  // Function to update URL parameters
  function updateURL(filters) {
    const urlParams = new URLSearchParams();
    filterGroups.forEach(group => {
      if (filters[group]) {
        urlParams.set(group, filters[group]);
      }
    });

    // Update the browser's address bar without reloading the page
    const newURL = `${window.location.pathname}?${urlParams.toString()}`;
    history.replaceState(null, '', newURL);
  }

  // Function to load selected filter values from URL
  function loadFromURL() {
    const urlParams = new URLSearchParams(window.location.search);

    filterGroups.forEach(group => {
      if (urlParams.has(group)) {
        const selectedValue = urlParams.get(group);
        const selectElement = document.getElementById(`filter-${group}`);
        if (selectElement) {
          selectElement.value = selectedValue;
        }
      }
    });

    // Trigger filtering based on URL parameters
    filterProjects();
  }

  // Add event listeners to dropdowns
  filterGroups.forEach(group => {
    const selectElement = document.getElementById(`filter-${group}`);
    if (selectElement) {
      selectElement.addEventListener('change', filterProjects);
    }
  });

  // Load filter values from URL on page load
  loadFromURL();
});
</script>

