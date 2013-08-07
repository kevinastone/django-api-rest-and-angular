module.exports = (grunt) ->
    grunt.initConfig(
        pkg: grunt.file.readJSON('package.json')
        coffee:
            files:
                src: ['example/src/js/**/*.coffee']
                dest: 'example/assets/js/script.js'
    )
    
    grunt.loadNpmTasks('grunt-contrib-coffee')
    
    grunt.registerTask('default', ['coffee'])
