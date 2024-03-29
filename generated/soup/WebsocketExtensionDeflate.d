/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage


module soup.WebsocketExtensionDeflate;

private import soup.WebsocketExtension;
private import soup.c.functions;
public  import soup.c.types;


/**
 * A SoupWebsocketExtensionDeflate is a [class@WebsocketExtension]
 * implementing permessage-deflate (RFC 7692).
 * 
 * This extension is used by default in a [class@Session] when [class@WebsocketExtensionManager]
 * feature is present, and always used by [class@Server].
 */
public class WebsocketExtensionDeflate : WebsocketExtension
{
	/** the main Gtk struct */
	protected SoupWebsocketExtensionDeflate* soupWebsocketExtensionDeflate;

	/** Get the main Gtk struct */
	public SoupWebsocketExtensionDeflate* getWebsocketExtensionDeflateStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return soupWebsocketExtensionDeflate;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)soupWebsocketExtensionDeflate;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (SoupWebsocketExtensionDeflate* soupWebsocketExtensionDeflate, bool ownedRef = false)
	{
		this.soupWebsocketExtensionDeflate = soupWebsocketExtensionDeflate;
		super(cast(SoupWebsocketExtension*)soupWebsocketExtensionDeflate, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return soup_websocket_extension_deflate_get_type();
	}
}
