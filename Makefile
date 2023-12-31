KARABINER_RULE := o-launcher-rule.json

all: karabiner 

karabiner:
	ruby ./o-launcher-script/CreateLauncherModeTemplate.rb > $(KARABINER_RULE)

install: 
	ln $(KARABINER_RULE) ~/.config/karabiner/assets/complex_modifications/$(KARABINER_RULE)

uninstall:
	rm ~/.config/karabiner/assets/complex_modifications/$(KARABINER_RULE)

clean: uninstall
	rm $(KARABINER_RULE)
