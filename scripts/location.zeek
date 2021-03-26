module Conn;

export {
	redef record Conn::Info += {
		## GeoIP lookup.
		orig_geo: geo_location &optional &log;
		## GeoIP lookup.
		resp_geo: geo_location &optional &log;
	};
}

event connection_state_remove(c: connection) 
	{
	c$conn$orig_geo = lookup_location(c$id$orig_h);
	c$conn$resp_geo = lookup_location(c$id$resp_h);
	}
