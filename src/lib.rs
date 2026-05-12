use zed_extension_api::{
    self as zed, settings::LspSettings, Command, LanguageServerId, Result, Worktree,
};

struct SudoLangExtension;

const SERVER_BINARY: &str = "sudolang-lsp";

impl zed::Extension for SudoLangExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &LanguageServerId,
        worktree: &Worktree,
    ) -> Result<Command> {
        let path = worktree.which(SERVER_BINARY).ok_or_else(|| {
            format!(
                "`{SERVER_BINARY}` was not found on $PATH. Install it with \
                 `cargo install --git https://github.com/dylan-gluck/sudolang-lsp` \
                 (or build from source) and reload the window."
            )
        })?;

        Ok(Command {
            command: path,
            args: Vec::new(),
            env: Vec::new(),
        })
    }

    fn language_server_initialization_options(
        &mut self,
        server_id: &LanguageServerId,
        worktree: &Worktree,
    ) -> Result<Option<zed::serde_json::Value>> {
        Ok(LspSettings::for_worktree(server_id.as_ref(), worktree)
            .ok()
            .and_then(|s| s.initialization_options))
    }

    fn language_server_workspace_configuration(
        &mut self,
        server_id: &LanguageServerId,
        worktree: &Worktree,
    ) -> Result<Option<zed::serde_json::Value>> {
        Ok(LspSettings::for_worktree(server_id.as_ref(), worktree)
            .ok()
            .and_then(|s| s.settings))
    }

    fn label_for_completion(
        &self,
        _language_server_id: &LanguageServerId,
        _completion: zed::lsp::Completion,
    ) -> Option<zed::CodeLabel> {
        None
    }
}

zed::register_extension!(SudoLangExtension);
