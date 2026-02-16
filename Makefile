.PHONY: health

health:
	@find . -name '*.lua' -type f -print0 | xargs -0 -n1 luac -p
	@nvim --headless '+qa'
