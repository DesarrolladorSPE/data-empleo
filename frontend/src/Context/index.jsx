import React from "react";
import PropTypes from "prop-types";

import { actualMonth, actualYear } from "../utils/dateFunctions";
import { graphLabels } from "../utils/chartTypes";
import { handleColorsByFilters } from "../utils/handleColors";

import { api } from "../utils/api";
import { fetchAllData } from "../utils/handleData/handleFetchData";
import { handleNotifications } from "../utils/handleNotifications";
import { handleInputChange } from "../utils/handleInputChange";
import { handleDeleteFile } from "../utils/handleData/handleFiles";
import { readExcelFile } from "../utils/readExcelFile";


export const AppContext = React.createContext();

const AppProvider = ({children}) => {
    AppProvider.propTypes = {
        children: PropTypes.node.isRequired,
    }

	//-------------------------------------
    const [apiUri, setApiUri] = React.useState(api);

    //LOADING, ERROR
    const [loading, setLoading] = React.useState(null);

    //Login Auth
    const [auth, setAuth] = React.useState(false);
    const [message, setMessage] = React.useState("");
    const [name, setName] = React.useState("");

    // Valores de la Grafica
    const [editingGraph, setEditingGraph] = React.useState(false);
    const [graphValues, setGraphValues] = React.useState({
        title: null,
        year: actualYear,
        month: actualMonth,
        description: null,

        graphType: "bar",
        indexAxis: "x",
        labels: null,
        datasetLabel: null,
        graphValues: null
    });


    // 
    const [filters, setFilters] = React.useState({
        "year": actualYear,
        "month": actualMonth,
    })

    // RESPONSE:
    const [responseData, setResponseData] = React.useState({});

    const fetchData = async (endpoints, setState=setResponseData) => {
        try {
            setLoading(true);
            const data = await fetchAllData(endpoints);
            setState((prevData) => ({ ...prevData, ...data}));
        } 
        catch (err) {
            handleNotifications("error", err.message)
        } 
        finally {
            setLoading(false);
        }
    }


    React.useEffect(() => {
        const endpoints = [
            `/slider`,
            "/users",
            "/file/folders",
            "/file",
            "/colocaciones",
            "/columns/filter"
        ]

        fetchData(endpoints)
    }, []);
    
    // Graficas y paginacion
    const [currentGraphsPage, setCurrentGraphsPage] = React.useState(1);

    React.useEffect(() => {
        const filterParams = new URLSearchParams(filters);

        const endpoints = [
            `graph?page=${currentGraphsPage}`,
            `graph/export?${filterParams.toString()}`,
        ]

        fetchData(endpoints);
    }, [currentGraphsPage, filters]);

    
    // Dashboard filters
    const [dashboardFilters, setDashboardFilters] = React.useState({
        column: null,
        mes_coloca: 3,
        anio_coloca: 2019,
    });


    //CAMBIO DE COLORES
    const [activeHighContrast, setActiveHighContrast] = React.useState(false);
    React.useEffect(() => {
        handleColorsByFilters(activeHighContrast);
    }, [activeHighContrast]);


    
    // Screen Width
    const [windowWidth, setWindowWidth] = React.useState(window.innerWidth);
    React.useEffect(() => {
        function handleResize() {
          setWindowWidth(window.innerWidth);
        }
    
        window.addEventListener('resize', handleResize);
        return () => window.removeEventListener('resize', handleResize);
      }, []);

    // Modal de Confirmacion
    const [openConfirmationModal, setOpenConfirmationModal] = React.useState({
        status: false,
        title: "",
        onConfirm: null,
        onCancel: null,
    });


    // Slider Cards Values
    const [editingSliderCard, setEditingSliderCard] = React.useState(false);
    const [sliderValues, setSliderValues] = React.useState({
        NOMBRE: null,
        VALOR: null,
        PORCENTAJE: null,
        ICONO: null,
    })

    // Edicion de Usuarios
    const [users, setUsers] = React.useState(null);

    // Previsualizador de Excel
    const [previewFile, setPreviewFile] = React.useState(null);
    const handleExcelFile = async (file, item) => {
        try {
            setLoading(true);
            const excelJSON = await readExcelFile(file);            

            const fileInfo = [{ fileJSON: excelJSON, name: item.array[0], item: item }]

            localStorage.setItem("excel-json", JSON.stringify(fileInfo))
            
            window.open('#/excel-preview', '_blank');
        } 
        catch (err) {
            handleNotifications("error", err.message);
        } finally {
            setLoading(false);
        }
    }

    // Archivos de las tablas
    const deleteFile = async (item) => {
        setLoading(true)

        await handleDeleteFile(`${item?.folder}/${item.subFolder}/${item?.file}`)

        setLoading(false);
    }

    return (
        <AppContext.Provider
            value={{
                apiUri,
                loading,
                setLoading,

                filters,
                setFilters,
                
                auth,
                setAuth,
                
                name,
                setName,

                message,
                setMessage,


                //Tamaño de la pantalla
                windowWidth,
                setWindowWidth,


                //Informacion desde el serveidor
                responseData,
                setResponseData,

                //COLORES POR FILTRO
                handleColorsByFilters,
                activeHighContrast,
                setActiveHighContrast,

                // Valores de la Grafica
                graphValues,
                setGraphValues,
                editingGraph,
                setEditingGraph,

                //Modal de confirmación
                openConfirmationModal,
                setOpenConfirmationModal,

                // Slider Cards
                editingSliderCard,
                setEditingSliderCard,
                sliderValues,
                setSliderValues,

                //Usuarios
                users,
                setUsers,

                // Excel
                previewFile,
                setPreviewFile,
                handleExcelFile,

                //Archivos de las tablas
                deleteFile,

                // Paginacion de graficas
                currentGraphsPage,
                setCurrentGraphsPage,

                //Dashboard filters
                dashboardFilters,
                setDashboardFilters,
                fetchData
            }}
        >
            {children}
        </AppContext.Provider>
    )
}

export { AppProvider }