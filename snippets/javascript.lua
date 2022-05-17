-- Util Functions
local function copy(args)
  return args[1]
end

return {

  s(--React Reducer Case
    { -- could also just pass trig, s("trig text", {nodes})
      trig = "cas",                -- text trigger
      name = "React Reducer Case",        -- name for tools
      dscr = "reactjs reducer case",-- long description
    },
    {
      t( "case '" ), i(1, "action.type"), t({ "':",
         "  console.log('" }), f(copy, 1), t({ ": ');",
         "  return " }), f(copy, 1), t( "(state);" ),
         i(0)
    }
  ),

  s(--Constant Function
    {
      trig = "con",
      name = "Constant Function",
      dscr = [=[const {fn name} ({args}) => {

              };]=]
    },
    {
      t("const "), i(1, "fn name"), t(" = ("), i(2, "args"), t({") => {",
        "  " }), i(0), t({"",
        "};"})
    }
  ),

  s(--React import useContext
    {
      trig = "imp",
      name = "React import useContext",
      dscr = "import { {name}Context } from '{location}/{Name}';"
    },
    {
      t("import { "), i(1, "name"), t("Context } from '"), i(2, "location"), t({"';",
        ""}), i(0)
    }
  ),

  s(--React useContext assignment
    {
      trig = "use",
      name = "React useContext assignment",
      dscr = "const ['state', 'dispatch'] = React.useContext({Name}Context});"
    },
    {
      t("const [state, dispatch] = React.useContext("), i(1, "name"), t({"Context);",
        ""}), i(0)
    }
  ),

  s(--React onClick dispatch
    {
      trig = "onC",
      name = "onClick dispatch",
      dscr = "onClick={ ()=> dispatch({type: '{{action.type}}'}) }"
    },
    {
      t("onClick={ ()=> dispatch({type: '"), i(1, "action.type"), t("'})}"), i(0)
    }
  ),

  s(--React onClick dispatch with preventDefault
    {
      trig = "onC",
      name = "onClick dispatch with preventDefault",
      dscr = [=[onClick={ (event)=> {
                event.preventDefault();
                dispatch({type: '{{action.type}}'}) }
                }]=]
    },
    {
      t({"onClick={ (event)=> {",
         "  event.preventDefault();",
         "  dispatch({type: '"}), i(1, "action.type"), t({"'})}",
         "}"}), i(0)
    }
  ),

  s(--React onClick description with stopPropagation
    {
      trig = "onC",
      name = "onClick dispatch with stopPropagation",
      dscr = [=[onClick={ (event)=> {
                event.stopPropagation();
                dispatch({type: '{{action.type}}'}) }
                }]=]
    },
    {
      t({"onClick={ (event)=> {",
         "  event.stopPropagation();",
         "  dispatch({type: '"}), i(1, "action.type"), t({"'})}",
         "}"}), i(0)
    }
  ),

  s(--React Reducer Context and Provider 
    {
      trig = "reducercontext",
      name = "React Reducer Context",
      dscr = [=[import React from "react";
                import { Reducer, InitialState } from './Reducer';


                export const {Name}Context = React.createContext({
                  state: InitialState,
                  dispatch: () => null
                });

                export const {Name}Provider = ({ children }) => {
                  const [state, dispatch] = React.useReducer(Reducer, InitialState);

                  return (
                    <{Name}Context.Provider value={( state, dispatch ]}>
                      { children }
                    </{Name}Context.Provider>
                  );
                };}]=]
    },
    {
      t({"import React from 'react';", 
         "import { Reducer, InitialState } from './Reducer';",
         "",
         "",
         "export const "}), i(1, "Name"), t({"Context = React.createContext({",
         "  state: InitialState,",
         "  dispatch: () => null",
         "});",
         "",
         "export const ",}), f(copy, 1), t({"Provider = ({ children }) => {",
         "  const [state, dispatch] = React.useReducer(Reducer, InitialState);",
         "",
         "  return (",
         "    <"}), f(copy, 1), t({"Context.Provider value={( state, dispatch ]}>",
         "     { children }",
         "    </"}), f(copy, 1), t({"Context.Provider>",
         "  );",
         "};"})
    }
  ),

  s(
    {
      trig = "reactcomponent",
      name = "React Component",
      dscr =
      [=[import React from "react";
         
         const {NAME} = () => {
          
          return (
            <div classname="{NAME}">
              <h2>{NAME}</h2>{EXIT POINT}
            </div>
          );
         };

         export default {NAME}
      ]=]
    },
    {
      t({"import React from 'react';",
         "",
         "const "}), i(1, "Name"), t({" = () => {",
         "",
         "  return (",
         "    <div classname='"}), f(copy, 1), t({"'>",
         "      <h2>"}), f(copy, 1), t("</h2>"), i(0), t({"",
         "    </div>",
         ");",
         "};",
         "",
         "export default "}), f(copy, 1)
    }
  ),

},{}

