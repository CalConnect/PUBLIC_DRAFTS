# Convert JSCalendar JSON examples to RFC XML format.
#
# Copyright 2018, Robert Stepanek (rsto@fastmailteam.com)
#
# MIT License. Also see file LICENSE.
#

import sys
import json

for e in json.load(sys.stdin):
    print('<section anchor="example-{0}" title="{1}">'.format(e['a'], e['t']))
    print('    <t>');
    print('    {0}'.format(e['d']));
    print('    </t>');
    print('    <figure>');
    print('          <artwork><![CDATA[');
    print(json.dumps(e['o'], indent=2, ensure_ascii=False));
    print('          ]]></artwork>');
    print('    </figure>');
    print('</section>')
