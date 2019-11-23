import os

# behaviour
# Firefox desktop user agent
c.content.headers.user_agent = 'Mozilla/5.0 (X11; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/70.0'
# Firefox mobile user agent
# c.content.headers.user_agent = 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1'
c.editor.command = ['st', '-t', 'scratchpad', '-e', 'nvim' , '{file}']
c.downloads.location.directory = os.path.expanduser('~/tmp/')
c.content.autoplay = False
c.content.javascript.can_open_tabs_automatically = True
c.tabs.background = True
c.url.default_page = 'about:blank'
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/html/?q={}'}
c.url.start_pages = ['about:blank']
c.zoom.default = '225%'
c.zoom.levels = ['25%', '33%', '50%', '67%', '75%', '90%', '100%', '110%', '125%', '150%', '175%', '200%', '225%', '250%', '300%', '400%']
c.hints.auto_follow_timeout = 500
c.input.partial_timeout = 30000

# javascript
c.content.javascript.enabled = False
js_whitelist_file = os.path.expanduser("~/.config/qutebrowser/jswhitelist")
js_whitelist = []
if os.path.exists(js_whitelist_file):
    with open(js_whitelist_file) as f:
        js_whitelist += filter(lambda l: bool(l), f.read().split("\n"))
for site in js_whitelist:
    with config.pattern(site) as p:
        p.content.javascript.enabled = True

# styling
font_size = '12pt'
monospace_font_definition = f'{font_size} monospace'
monospace_bold_font_definition = f'bold {monospace_font_definition}'
c.fonts.completion.category = monospace_bold_font_definition
c.fonts.completion.entry = monospace_font_definition
c.fonts.debug_console = monospace_font_definition
c.fonts.downloads = monospace_font_definition
c.fonts.hints = monospace_font_definition
c.fonts.keyhint = monospace_font_definition
c.fonts.messages.error = monospace_font_definition
c.fonts.messages.info = monospace_font_definition
c.fonts.messages.warning = monospace_font_definition
c.fonts.monospace = '"Terminus (TTF)", "xos4 Terminus", Terminus, Monospace, "DejaVu Sans  Mono", Monaco, "Bitstream Vera Sans Mono", "Andale Mono", "Courier New", Courier,  "Liberation Mono", monospace, Fixed, Consolas, Terminal'
c.fonts.prompts = '12pt sans-serif'
c.fonts.statusbar = monospace_font_definition
c.fonts.tabs = monospace_font_definition
c.window.hide_decoration = True
c.colors.hints.bg = 'qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 rgba(255, 247, 133, 0.9), stop:1 rgba(255, 197, 66, 0.9))'
c.colors.keyhint.bg = 'rgba(0, 0, 0, 90%)'

# bindings
config.bind('K', 'tab-next')
config.bind('J', 'tab-prev')
