{application,gebetsgruppe,
             [{mod,{gebetsgruppe_app,[]}},
              {description,"The Prayer Group"},
              {vsn,"0.0.1"},
              {applications,[kernel,stdlib,cowboy]},
              {env,[{http_port,4000}]},
              {registered,[]},
              {modules,[gebetsgruppe,gebetsgruppe_app,gebetsgruppe_handler,
                        gebetsgruppe_sup]}]}.
