.PHONY: verify

verify:
	@bash ./utl/checks/project-structure.sh
	@bash ./utl/checks/no-emoji.sh
