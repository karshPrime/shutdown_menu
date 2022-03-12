#!/usr/bin/env python

import gi
gi.require_version("Gtk", "3.0")
from gi.repository import Gtk
import os

class mainWindow(Gtk.Window):
	def __init__(self):
		Gtk.Window.__init__(self, title="power options")
		self.set_default_size(240, 100)
		self.set_position(Gtk.WindowPosition.CENTER_ALWAYS)
        
		global headBox
		headBox = Gtk.Box()
		self.buttonLayout('../icons/shutdown.png', self.shutDown)
		self.buttonLayout('../icons/restart.png', self.reStart)
		self.buttonLayout('../icons/logout.png', self.logout)
		self.buttonLayout('../icons/hibernate.png', self.hibernate)
		self.add(headBox)

	def buttonLayout(self, icon, command):
		button = Gtk.Button.new()
		image_icon = Gtk.Image.new_from_file(icon)
		button.set_image(image_icon)
		button.connect("clicked", command)
		headBox.add(button)
        
	def shutDown(self, button):
		os.system('shutdown 0')
    
	def reStart(self, button):
		os.system('reboot')

	def hibernate(self, button):
		os.system('systemctl hibernate')

	def logout(self, button):
		# os.system('/usr/bin/gnome-session-quit --no-prompt') 	# for gnome de
		os.system('i3-msg exit')								# for i3wm
		Gtk.main_quit()
		

win = mainWindow()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
