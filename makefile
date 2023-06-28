test: assemble compare

assemble: 
	$(MAKE) -C test/without
	$(MAKE) -C test/with

compare:
	$(MAKE) -C test/with checkDiff
	@echo "All is good!"

clean:
	$(RM) test/with/*.out
	$(RM) test/without/*.out
