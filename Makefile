KARABINER_RULE := o-launcher-rule.json

.PHONY: karabiner nvim tmux

all: karabiner nvim

karabiner:
	ruby ./o-launcher-script/CreateLauncherModeTemplate.rb > $(KARABINER_RULE)

nvim:
	ln -s ~/config/nvim ~/.config/nvim
	
tmux:
	ln -s ~/config/tmux ~/.config/tmux

install: 
	ln $(KARABINER_RULE) ~/.config/karabiner/assets/complex_modifications/$(KARABINER_RULE)

uninstall:
	rm ~/.config/karabiner/assets/complex_modifications/$(KARABINER_RULE)

clean: uninstall
	rm $(KARABINER_RULE)
	rm ~/.config/nvim
	rm ~/.config/tmux
