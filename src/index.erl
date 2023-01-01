-module(index).
-include_lib("nitrogen_core/include/wf.hrl").

-export([main/0]).

main() -> [
	[
		#template {text=["<script src=/static/nitrogen/", Script, "></script>"]}
		||
		Script <- ["jquery.js", "jquery-ui.min.js", "nitrogen.min.js", "livevalidation.min.js", "bert.min.js"]
	],
	"hello, world!",
	#template {text="<script>[[[script]]]</script>"}
].

