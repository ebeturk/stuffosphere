// Entry point for the build script in your package.json


import "@hotwired/turbo-rails"
import "bootstrap"
import "./controllers"
import "controllers"
import flatpickr from "flatpickr";
import { Application } from "stimulus";
import Flatpickr from "stimulus-flatpickr/src/flatpickr_controller.js";
import "flatpickr/dist/flatpickr.min.css";

const application = Application.start();
application.register("flatpickr", Flatpickr);
