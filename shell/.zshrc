#!/bin/zsh

#
# User configuration sourced by interactive shells
#

setopt LOCAL_OPTIONS          # allow functions to have local options
setopt LOCAL_TRAPS            # allow functions to have local traps
setopt CLOBBER
setopt RM_STAR_SILENT         # dont ask for confirmation in rm globs
setopt CORRECT                # auto-correct commands
setopt COMPLETE_IN_WORD       # dont nice background tasks
setopt PROMPT_SUBST           # expand prompt sequences

# Load basic settings
source ${HOME}/.basic.zshrc

