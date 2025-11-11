//= require active_admin/base
//= require activeadmin/quill_editor/quill
//= require activeadmin/quill_editor_input
document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll(".remove-image").forEach((btn) => {
    btn.addEventListener("click", function (e) {
      e.preventDefault();
      const imageId = this.dataset.image_id;

      // Add hidden field to form to tell Rails to remove this image
      const input = document.createElement("input");
      input.type = "hidden";
      input.name = "remove_image_ids[]";
      input.value = imageId;

      this.closest("form").appendChild(input);

      // Remove image from UI immediately
      this.parentElement.remove();
    });
  });
});
