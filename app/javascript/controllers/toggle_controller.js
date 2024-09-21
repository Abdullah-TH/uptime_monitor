import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller"
export default class extends Controller {
  static targets = ["content", "chevronUp", "chevronDown"];
  connect() {
  }

  toggle(event) {
    event.preventDefault();  // Prevent default link behavior

    // Toggle content visibility
    if (this.contentTarget.classList.contains('hidden')) {
      // Show content
      this.contentTarget.classList.remove('hidden')
      setTimeout(() => {
        this.contentTarget.classList.remove('opacity-0')
      }, 10) // Small timeout to trigger opacity change after removing 'hidden'

      // Show chevron up, hide chevron down
      this.chevronUpTarget.classList.remove('hidden')
      this.chevronDownTarget.classList.add('hidden')
    } else {
      // Hide content
      this.contentTarget.classList.add('opacity-0')
      setTimeout(() => {
        this.contentTarget.classList.add('hidden')
      }, 300) // Match the transition duration

      // Show chevron down, hide chevron up
      this.chevronDownTarget.classList.remove('hidden')
      this.chevronUpTarget.classList.add('hidden')
    }
  }
}
