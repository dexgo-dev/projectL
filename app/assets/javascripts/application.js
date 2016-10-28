// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery
//= require bootstrap-sprockets


$(function () {
    $('.input-group-addon.beautiful').each(function () {
        
        var $widget = $(this),
            $input = $widget.find('input'),
            type = $input.attr('type');
            settings = {
                checkbox: {
                    on: { icon: 'fa fa-check-circle-o' },
                    off: { icon: 'fa fa-circle-o' }
                },
                radio: {
                    on: { icon: 'fa fa-dot-circle-o' },
                    off: { icon: 'fa fa-circle-o' }
                }
            };
            
        $widget.prepend('<span class="' + settings[type].off.icon + '"></span>');
            
        $widget.on('click', function () {
            $input.prop('checked', !$input.is(':checked'));
            updateDisplay();
        });
            
        function updateDisplay() {
            var isChecked = $input.is(':checked') ? 'on' : 'off';
                
            $widget.find('.fa').attr('class', settings[type][isChecked].icon);
                
            //Just for desplay
            isChecked = $input.is(':checked') ? 'checked' : 'not Checked';
            $widget.closest('.input-group').find('input[type="text"]').val('Input is currently ' + isChecked)
        }
        
        updateDisplay();
    });
});
