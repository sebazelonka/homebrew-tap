cask "ai-chat-markdown" do
  version "0.1.0"
  sha256 "b517f2917a2760679835fd53807ba9b74849febbab6f6a282f869385805e667f"

  url "https://github.com/sebazelonka/homebrew-tap/releases/download/ai-chat-markdown-v0.1.0/ai-chat-markdown_0.1.0_aarch64.dmg"
  name "AI Chat Markdown"
  desc "Local-first AI chat app: every session saved as markdown on disk"
  homepage "https://gitlab.com/sebazelonka/ai-chat-markdown"

  # The binary is ad-hoc signed (no Apple Developer account), so Gatekeeper
  # flags provenance on Tahoe+; drop quarantine after install.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/AI Chat Markdown.app"]
  end

  app "AI Chat Markdown.app"
end