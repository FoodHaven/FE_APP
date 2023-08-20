const gulp = require('gulp');
const sass = require('gulp-sass')(require('sass'));

// Compile SCSS into CSS
function style() {
  return gulp.src('./scss/**/*.scss') // Source of any SCSS file
    .pipe(sass().on('error', sass.logError)) // Compile SCSS to CSS and log errors
    .pipe(gulp.dest('./css')); // Output destination for the compiled CSS
}

// Export the task so it becomes publicly available
exports.style = style;