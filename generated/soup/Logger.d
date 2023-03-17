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


module soup.Logger;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import soup.SessionFeatureIF;
private import soup.SessionFeatureT;
private import soup.c.functions;
public  import soup.c.types;


/**
 * Debug logging support
 * 
 * #SoupLogger watches a [class@Session] and logs the HTTP traffic that
 * it generates, for debugging purposes. Many applications use an
 * environment variable to determine whether or not to use
 * #SoupLogger, and to determine the amount of debugging output.
 * 
 * To use #SoupLogger, first create a logger with [ctor@Logger.new], optionally
 * configure it with [method@Logger.set_request_filter],
 * [method@Logger.set_response_filter], and [method@Logger.set_printer], and
 * then attach it to a session (or multiple sessions) with
 * [method@Session.add_feature].
 * 
 * By default, the debugging output is sent to `stdout`, and looks something
 * like:
 * 
 * ```
 * > POST /unauth HTTP/1.1
 * > Soup-Debug-Timestamp: 1200171744
 * > Soup-Debug: SoupSession 1 (0x612190), SoupMessage 1 (0x617000), GSocket 1 (0x612220)
 * > Host: localhost
 * > Content-Type: text/plain
 * > Connection: close
 * 
 * &lt; HTTP/1.1 201 Created
 * &lt; Soup-Debug-Timestamp: 1200171744
 * &lt; Soup-Debug: SoupMessage 1 (0x617000)
 * &lt; Date: Sun, 12 Jan 2008 21:02:24 GMT
 * &lt; Content-Length: 0
 * ```
 * 
 * The `Soup-Debug-Timestamp` line gives the time (as a `time_t`) when the
 * request was sent, or the response fully received.
 * 
 * The `Soup-Debug` line gives further debugging information about the
 * [class@Session], [class@Message], and [class@Gio.Socket] involved; the hex
 * numbers are the addresses of the objects in question (which may be useful if
 * you are running in a debugger). The decimal IDs are simply counters that
 * uniquely identify objects across the lifetime of the #SoupLogger. In
 * particular, this can be used to identify when multiple messages are sent
 * across the same connection.
 * 
 * Currently, the request half of the message is logged just before
 * the first byte of the request gets written to the network (from the
 * [signal@Message::starting] signal).
 * 
 * The response is logged just after the last byte of the response body is read
 * from the network (from the [signal@Message::got-body] or
 * [signal@Message::got-informational] signal), which means that the
 * [signal@Message::got-headers] signal, and anything triggered off it (such as
 * #SoupMessage::authenticate) will be emitted *before* the response headers are
 * actually logged.
 * 
 * If the response doesn't happen to trigger the [signal@Message::got-body] nor
 * [signal@Message::got-informational] signals due to, for example, a
 * cancellation before receiving the last byte of the response body, the
 * response will still be logged on the event of the [signal@Message::finished]
 * signal.
 */
public class Logger : ObjectG, SessionFeatureIF
{
	/** the main Gtk struct */
	protected SoupLogger* soupLogger;

	/** Get the main Gtk struct */
	public SoupLogger* getLoggerStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return soupLogger;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)soupLogger;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (SoupLogger* soupLogger, bool ownedRef = false)
	{
		this.soupLogger = soupLogger;
		super(cast(GObject*)soupLogger, ownedRef);
	}

	// add the SessionFeature capabilities
	mixin SessionFeatureT!(SoupLogger);


	/** */
	public static GType getType()
	{
		return soup_logger_get_type();
	}

	/**
	 * Creates a new #SoupLogger with the given debug level.
	 *
	 * If you need finer control over what message parts are and aren't
	 * logged, use [method@Logger.set_request_filter] and
	 * [method@Logger.set_response_filter].
	 *
	 * Params:
	 *     level = the debug level
	 *
	 * Returns: a new #SoupLogger
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(SoupLoggerLogLevel level)
	{
		auto __p = soup_logger_new(level);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(SoupLogger*) __p, true);
	}

	/**
	 * Get the maximum body size for @logger.
	 *
	 * Returns: the maximum body size, or -1 if unlimited
	 */
	public int getMaxBodySize()
	{
		return soup_logger_get_max_body_size(soupLogger);
	}

	/**
	 * Sets the maximum body size for @logger (-1 means no limit).
	 *
	 * Params:
	 *     maxBodySize = the maximum body size to log
	 */
	public void setMaxBodySize(int maxBodySize)
	{
		soup_logger_set_max_body_size(soupLogger, maxBodySize);
	}

	/**
	 * Sets up an alternate log printing routine, if you don't want
	 * the log to go to `stdout`.
	 *
	 * Params:
	 *     printer = the callback for printing logging output
	 *     printerData = data to pass to the callback
	 *     destroy = a #GDestroyNotify to free @printer_data
	 */
	public void setPrinter(SoupLoggerPrinter printer, void* printerData, GDestroyNotify destroy)
	{
		soup_logger_set_printer(soupLogger, printer, printerData, destroy);
	}

	/**
	 * Sets up a filter to determine the log level for a given request.
	 *
	 * For each HTTP request @logger will invoke @request_filter to
	 * determine how much (if any) of that request to log. (If you do not
	 * set a request filter, @logger will just always log requests at the
	 * level passed to [ctor@Logger.new].)
	 *
	 * Params:
	 *     requestFilter = the callback for request debugging
	 *     filterData = data to pass to the callback
	 *     destroy = a #GDestroyNotify to free @filter_data
	 */
	public void setRequestFilter(SoupLoggerFilter requestFilter, void* filterData, GDestroyNotify destroy)
	{
		soup_logger_set_request_filter(soupLogger, requestFilter, filterData, destroy);
	}

	/**
	 * Sets up a filter to determine the log level for a given response.
	 *
	 * For each HTTP response @logger will invoke @response_filter to
	 * determine how much (if any) of that response to log. (If you do not
	 * set a response filter, @logger will just always log responses at
	 * the level passed to [ctor@Logger.new].)
	 *
	 * Params:
	 *     responseFilter = the callback for response debugging
	 *     filterData = data to pass to the callback
	 *     destroy = a #GDestroyNotify to free @filter_data
	 */
	public void setResponseFilter(SoupLoggerFilter responseFilter, void* filterData, GDestroyNotify destroy)
	{
		soup_logger_set_response_filter(soupLogger, responseFilter, filterData, destroy);
	}
}
